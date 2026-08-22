import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/services/notification_service.dart';
import '../../data/datasources/task_local_datasource.dart';
import '../../data/repositories/task_repository_impl.dart';
import '../../domain/entities/task_entity.dart';
import '../../domain/usecases/add_task_usecase.dart';
import '../../domain/usecases/delete_task_usecase.dart';
import '../../domain/usecases/get_sorted_tasks_usecase.dart';
import '../../domain/usecases/schedule_task_notification_usecase.dart';
import '../../domain/usecases/update_task_usecase.dart';

class HomeProvider extends ChangeNotifier {
  List<TaskEntity> tasks = [];

  late final AddTaskUseCase _addTaskUseCase;
  late final UpdateTaskUseCase _updateTaskUseCase;
  late final DeleteTaskUseCase _deleteTaskUseCase;
  late final GetSortedTasksUseCase _getSortedTasksUseCase;

  HomeProvider() {
    final localDataSource = TaskLocalDataSource();
    final repository = TaskRepositoryImpl(localDataSource);
    final notificationService = NotificationService();
    notificationService.init(); // Fire and forget setup
    final scheduleUseCase = ScheduleTaskNotificationUseCase(notificationService);

    _addTaskUseCase = AddTaskUseCase(repository, scheduleUseCase);
    _updateTaskUseCase = UpdateTaskUseCase(repository, scheduleUseCase);
    _deleteTaskUseCase = DeleteTaskUseCase(repository, scheduleUseCase);
    _getSortedTasksUseCase = GetSortedTasksUseCase(repository);
  }

  // Temporary state for Add Note Screen
  DateTime? startDate;
  DateTime? endDate;
  TimeOfDay? time;
  TaskPriority priority = TaskPriority.medium;
  DateTime dateTimeNow = DateTime.now();

  Future<void> fetchNotesFromBox() async {
    tasks = await _getSortedTasksUseCase.execute();
    notifyListeners();
  }

  Future<void> addNote({required String title, required String description, required BuildContext context}) async {
    if (time != null && endDate != null) {
      // Create absolute deadline from endDate and time
      final deadline = DateTime(
        endDate!.year,
        endDate!.month,
        endDate!.day,
        time!.hour,
        time!.minute,
      );

      final newTask = TaskEntity(
        id: const Uuid().v4(),
        title: title,
        description: description,
        deadline: deadline,
        priority: priority,
      );

      await _addTaskUseCase.execute(newTask);
      resetDate();
      
      await fetchNotesFromBox();
      if (context.mounted) {
        Navigator.pop(context);
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all data (End Date and Time required)")),
      );
    }
  }

  Future<void> deleteNote({required TaskEntity task, required BuildContext context}) async {
    await _deleteTaskUseCase.execute(task);
    await fetchNotesFromBox();
    if (context.mounted) {
      Navigator.pop(context);
      Navigator.pop(context); // Pops the delete confirmation or bottom sheet if any
    }
  }

  Future<void> updateArchive(TaskEntity task) async {
    final updated = task.copyWith(isArchived: !task.isArchived);
    await _updateTaskUseCase.execute(updated);
    await fetchNotesFromBox();
  }

  Future<void> updateDone(TaskEntity task) async {
    final updated = task.copyWith(isCompleted: !task.isCompleted);
    await _updateTaskUseCase.execute(updated);
    await fetchNotesFromBox();
  }

  Future<void> selectStartDate(BuildContext context) async {
    startDate = await showDatePicker(
      context: context,
      firstDate: dateTimeNow,
      lastDate: dateTimeNow.add(const Duration(days: 31)),
    );
    notifyListeners();
  }

  Future<void> selectEndDate(BuildContext context) async {
    endDate = await showDatePicker(
      context: context,
      firstDate: dateTimeNow,
      lastDate: dateTimeNow.add(const Duration(days: 365)),
    );
    notifyListeners();
  }

  Future<void> selectTime(BuildContext context) async {
    time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    notifyListeners();
  }
  
  void setPriority(TaskPriority newPriority) {
    priority = newPriority;
    notifyListeners();
  }

  String convertDateString(DateTime date) {
    return date.toString().split(" ")[0];
  }

  void resetDate() {
    startDate = null;
    endDate = null;
    time = null;
    priority = TaskPriority.medium;
  }
}

import '../entities/task_entity.dart';
import '../repositories/task_repository.dart';
import 'schedule_task_notification_usecase.dart';

/// UseCase to add a new task and schedule its notification.
class AddTaskUseCase {
  final TaskRepository _repository;
  final ScheduleTaskNotificationUseCase _scheduleUseCase;

  AddTaskUseCase(this._repository, this._scheduleUseCase);

  Future<void> execute(TaskEntity task) async {
    await _repository.addTask(task);
    await _scheduleUseCase.execute(task);
  }
}

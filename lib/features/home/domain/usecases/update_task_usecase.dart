import '../entities/task_entity.dart';
import '../repositories/task_repository.dart';
import 'schedule_task_notification_usecase.dart';

/// UseCase to update an existing task and reschedule its notification.
class UpdateTaskUseCase {
  final TaskRepository _repository;
  final ScheduleTaskNotificationUseCase _scheduleUseCase;

  UpdateTaskUseCase(this._repository, this._scheduleUseCase);

  Future<void> execute(TaskEntity task) async {
    await _repository.updateTask(task);
    await _scheduleUseCase.execute(task);
  }
}

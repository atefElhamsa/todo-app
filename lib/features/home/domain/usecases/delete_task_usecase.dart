import '../entities/task_entity.dart';
import '../repositories/task_repository.dart';
import 'schedule_task_notification_usecase.dart';

/// UseCase to delete a task and cancel its notification.
class DeleteTaskUseCase {
  final TaskRepository _repository;
  final ScheduleTaskNotificationUseCase _scheduleUseCase;

  DeleteTaskUseCase(this._repository, this._scheduleUseCase);

  Future<void> execute(TaskEntity task) async {
    await _repository.deleteTask(task.id);
    await _scheduleUseCase.cancel(task);
  }
}

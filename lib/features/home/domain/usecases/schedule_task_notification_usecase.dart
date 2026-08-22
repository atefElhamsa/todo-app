import '../../../../core/services/notification_service.dart';
import '../entities/task_entity.dart';

/// UseCase to schedule or cancel a local notification for a task
class ScheduleTaskNotificationUseCase {
  final NotificationService _notificationService;

  ScheduleTaskNotificationUseCase(this._notificationService);

  /// Schedules a notification 1 hour before the task deadline.
  /// If the task is completed or archived, or the deadline has passed,
  /// it cancels any existing notification.
  Future<void> execute(TaskEntity task) async {
    final notificationId = task.id.hashCode;

    if (task.isCompleted || task.isArchived) {
      await _notificationService.cancelNotification(notificationId);
      return;
    }

    final notificationTime = task.deadline.subtract(const Duration(minutes: 1));
    
    if (notificationTime.isBefore(DateTime.now())) {
      await _notificationService.cancelNotification(notificationId);
      return;
    }

    await _notificationService.scheduleNotification(
      id: notificationId,
      title: 'Upcoming Deadline: ${task.title}',
      body: 'Your task is due at ${task.deadline.hour}:${task.deadline.minute.toString().padLeft(2, '0')}.',
      scheduledDate: notificationTime,
    );
  }

  Future<void> cancel(TaskEntity task) async {
    await _notificationService.cancelNotification(task.id.hashCode);
  }
}

import '../entities/task_entity.dart';
import '../repositories/task_repository.dart';

/// UseCase to fetch and sort tasks based on a smart prioritization algorithm.
class GetSortedTasksUseCase {
  final TaskRepository _repository;

  GetSortedTasksUseCase(this._repository);

  /// Fetches tasks and sorts them using a scoring formula.
  /// 
  /// **Smart Prioritization Formula:**
  /// The algorithm computes a `Score` for each task combining two main factors:
  /// 
  /// 1. **Priority Weight (P)**: 
  ///    - High = 3.0
  ///    - Medium = 2.0
  ///    - Low = 1.0
  /// 
  /// 2. **Urgency Factor (U)**:
  ///    - Calculates the remaining time until the deadline.
  ///    - We use a maximum consideration window of 7 days (168 hours).
  ///    - If a task is overdue (remaining time <= 0), `U = 1.0` (Maximum Urgency).
  ///    - If a task is more than 7 days away, `U = 0.0`.
  ///    - Otherwise, `U = 1.0 - (remaining_hours / 168.0)`.
  ///    - This creates a linear inverse-time function where urgency increases as the deadline approaches.
  /// 
  /// **Final Score**: `Score = P + (U * 3.0)`
  /// (We multiply U by 3.0 so that urgency has a comparable weight to the base priority).
  /// 
  /// Tasks are then sorted in descending order based on this score.
  /// Completed and Archived tasks are usually pushed to the bottom or filtered out by the UI, 
  /// but this use case returns all tasks sorted by their computed score.
  Future<List<TaskEntity>> execute() async {
    final tasks = await _repository.getTasks();
    
    tasks.sort((a, b) {
      // Push completed and archived tasks to the bottom regardless of score
      if (a.isCompleted && !b.isCompleted) return 1;
      if (!a.isCompleted && b.isCompleted) return -1;
      if (a.isArchived && !b.isArchived) return 1;
      if (!a.isArchived && b.isArchived) return -1;

      final scoreA = _calculateScore(a);
      final scoreB = _calculateScore(b);
      
      // Descending order (highest score first)
      return scoreB.compareTo(scoreA);
    });

    return tasks;
  }

  double _calculateScore(TaskEntity task) {
    // 1. Priority Weight
    double p = 1.0;
    switch (task.priority) {
      case TaskPriority.high:
        p = 3.0;
        break;
      case TaskPriority.medium:
        p = 2.0;
        break;
      case TaskPriority.low:
        p = 1.0;
        break;
    }

    // 2. Urgency Factor
    final now = DateTime.now();
    final remainingDuration = task.deadline.difference(now);
    final remainingHours = remainingDuration.inHours.toDouble();

    double u = 0.0;
    if (remainingHours <= 0) {
      u = 1.0; // Overdue
    } else if (remainingHours < 168) { // 168 hours = 7 days
      u = 1.0 - (remainingHours / 168.0);
    }

    // Final Score
    return p + (u * 3.0);
  }
}

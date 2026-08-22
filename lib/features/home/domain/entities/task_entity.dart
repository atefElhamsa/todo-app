enum TaskPriority {
  low,
  medium,
  high
}

class TaskEntity {
  final String id;
  final String title;
  final String description;
  final DateTime deadline;
  final TaskPriority priority;
  final bool isArchived;
  final bool isCompleted;

  TaskEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.deadline,
    this.priority = TaskPriority.medium,
    this.isArchived = false,
    this.isCompleted = false,
  });

  TaskEntity copyWith({
    String? id,
    String? title,
    String? description,
    DateTime? deadline,
    TaskPriority? priority,
    bool? isArchived,
    bool? isCompleted,
  }) {
    return TaskEntity(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      deadline: deadline ?? this.deadline,
      priority: priority ?? this.priority,
      isArchived: isArchived ?? this.isArchived,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}

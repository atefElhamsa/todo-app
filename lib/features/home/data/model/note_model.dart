import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';
import '../../domain/entities/task_entity.dart';
import 'package:intl/intl.dart';

part 'note_model.g.dart';

@HiveType(typeId: 0)
class NoteModel extends HiveObject {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String description;
  @HiveField(2)
  final String time;
  @HiveField(3)
  final String startDate;
  @HiveField(4)
  final String endDate;
  @HiveField(5)
  bool archiveOrNot;
  @HiveField(6)
  bool doneOrNot;
  @HiveField(7)
  String? priority;
  @HiveField(8)
  String? id;

  NoteModel({
    required this.title,
    required this.description,
    required this.time,
    required this.startDate,
    required this.endDate,
    this.archiveOrNot = false,
    this.doneOrNot = false,
    this.priority,
    this.id,
  });

  /// Maps NoteModel to a clean TaskEntity
  TaskEntity toEntity() {
    // Migrate missing ID for old records
    final entityId = id ?? const Uuid().v4();

    // Map deadline
    DateTime parsedDeadline;
    try {
      // time might be "10:30 AM", endDate "2023-10-15"
      final date = DateTime.parse(endDate);
      // Attempt to parse time
      final timeFormat = DateFormat("h:mm a");
      final parsedTime = timeFormat.parse(time);
      parsedDeadline = DateTime(date.year, date.month, date.day, parsedTime.hour, parsedTime.minute);
    } catch (e) {
      // Fallback if parsing fails
      parsedDeadline = DateTime.now().add(const Duration(days: 1));
    }

    // Map priority
    TaskPriority parsedPriority = TaskPriority.medium;
    if (priority == 'high') parsedPriority = TaskPriority.high;
    if (priority == 'low') parsedPriority = TaskPriority.low;

    return TaskEntity(
      id: entityId,
      title: title,
      description: description,
      deadline: parsedDeadline,
      priority: parsedPriority,
      isArchived: archiveOrNot,
      isCompleted: doneOrNot,
    );
  }

  /// Creates a NoteModel from a TaskEntity
  static NoteModel fromEntity(TaskEntity task) {
    return NoteModel(
      id: task.id,
      title: task.title,
      description: task.description,
      // Store back in the legacy format so we don't break things, or update it
      endDate: task.deadline.toString().split(' ')[0], 
      startDate: task.deadline.toString().split(' ')[0], // Syncing them for now to avoid confusion
      time: DateFormat("h:mm a").format(task.deadline),
      archiveOrNot: task.isArchived,
      doneOrNot: task.isCompleted,
      priority: task.priority.name,
    );
  }
}

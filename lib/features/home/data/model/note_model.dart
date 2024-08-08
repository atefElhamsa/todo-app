class NoteModel {
  final String title;
  final String description;
  final String time;
  final String startDate;
  final String endDate;
  bool archiveOrNot;
  bool doneOrNot;

  NoteModel({
    required this.title,
    required this.description,
    required this.time,
    required this.startDate,
    required this.endDate,
    this.archiveOrNot = false,
    this.doneOrNot = false,
  });
}


import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/core/utils/app_texts.dart';

import '../../data/model/note_model.dart';

class HomeProvider extends ChangeNotifier {
  List<NoteModel> notes = [];
  var notesBox = Hive.box<NoteModel>(AppTexts.notesBox);

  addNote({required String title, required String description, context}) async {
    if (time != null && startDate != null && endDate != null) {
      notes.add(
        NoteModel(
          title: title,
          description: description,
          time: time!.format(context),
          startDate: convertDateString(startDate!),
          endDate: convertDateString(endDate!),
        ),
      );
      await notesBox.add(
        NoteModel(
          title: title,
          description: description,
          time: time!.format(context),
          startDate: convertDateString(startDate!),
          endDate: convertDateString(endDate!),
        ),
      );
      resetDate();
      notifyListeners();
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Fill Data"),
        ),
      );
    }
  }

  deleteNote({required NoteModel noteModel, context}) async {
    notes.remove(noteModel);
    await notesBox.deleteAt(notes.indexOf(noteModel) + 1);
    Navigator.pop(context);
    Navigator.pop(context);
    notifyListeners();
  }

  updateArchive(int index) {
    notes[index].archiveOrNot = !notes[index].archiveOrNot;
    notesBox.putAt(index, notes[index]);
    notifyListeners();
  }

  updateDone(int index) {
    notes[index].doneOrNot = !notes[index].doneOrNot;
    notesBox.putAt(index, notes[index]);
    notifyListeners();
  }

  DateTime? startDate;
  DateTime? endDate;
  TimeOfDay? time;
  DateTime dateTimeNow = DateTime.now();

  selectStartDate(context) async {
    startDate = await showDatePicker(
      context: context,
      firstDate: dateTimeNow,
      lastDate: dateTimeNow.add(
        const Duration(days: 31),
      ),
    );
    notifyListeners();
  }

  selectEndDate(context) async {
    endDate = await showDatePicker(
      context: context,
      firstDate: dateTimeNow,
      lastDate: dateTimeNow.add(
        const Duration(days: 365),
      ),
    );
    notifyListeners();
  }

  selectTime(context) async {
    time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    notifyListeners();
  }

  String convertDateString(DateTime date) {
    return date.toString().split(" ")[0];
  }

  resetDate() {
    startDate = null;
    endDate = null;
    time = null;
  }

  fetchNotesFromBox() {
    notes = notesBox.values.toList();
    notifyListeners();
  }
}

import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';
import '../../../../../core/utils/app_texts.dart';
import '../model/note_model.dart';

class TaskLocalDataSource {
  Box<NoteModel> get _box => Hive.box<NoteModel>(AppTexts.notesBox);

  Future<List<NoteModel>> getTasks() async {
    final tasks = _box.values.toList();
    bool needsMigration = false;
    
    // Assign IDs to old records if they don't have one
    for (int i = 0; i < tasks.length; i++) {
      if (tasks[i].id == null) {
        tasks[i].id = const Uuid().v4();
        await _box.putAt(i, tasks[i]);
        needsMigration = true;
      }
    }
    
    return needsMigration ? _box.values.toList() : tasks;
  }

  Future<void> addTask(NoteModel note) async {
    // Generate an ID if it's somehow missing (it shouldn't be based on fromEntity)
    note.id ??= const Uuid().v4();
    await _box.add(note);
  }

  Future<void> updateTask(NoteModel note) async {
    final index = _box.values.toList().indexWhere((element) => element.id == note.id);
    if (index != -1) {
      await _box.putAt(index, note);
    }
  }

  Future<void> deleteTask(String id) async {
    final index = _box.values.toList().indexWhere((element) => element.id == id);
    if (index != -1) {
      await _box.deleteAt(index);
    }
  }
}

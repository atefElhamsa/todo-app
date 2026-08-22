import '../../domain/entities/task_entity.dart';
import '../../domain/repositories/task_repository.dart';
import '../datasources/task_local_datasource.dart';
import '../model/note_model.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskLocalDataSource _localDataSource;

  TaskRepositoryImpl(this._localDataSource);

  @override
  Future<List<TaskEntity>> getTasks() async {
    final noteModels = await _localDataSource.getTasks();
    return noteModels.map((model) => model.toEntity()).toList();
  }

  @override
  Future<void> addTask(TaskEntity task) async {
    final noteModel = NoteModel.fromEntity(task);
    await _localDataSource.addTask(noteModel);
  }

  @override
  Future<void> updateTask(TaskEntity task) async {
    final noteModel = NoteModel.fromEntity(task);
    await _localDataSource.updateTask(noteModel);
  }

  @override
  Future<void> deleteTask(String id) async {
    await _localDataSource.deleteTask(id);
  }
}

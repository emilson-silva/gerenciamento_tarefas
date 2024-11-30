import 'package:gerenciamento_tarefas/features/task/data/models/task_model.dart';
import 'package:hive/hive.dart';

import '../../domain/entities/task.dart';
import '../../domain/repositories/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  final Box<TaskModel> _taskBox;

  TaskRepositoryImpl(this._taskBox);

  @override
  Future<List<Task>> getTasks() async {
    return _taskBox.values.map((taskModel) {
      return Task(
        title: taskModel.title,
        description: taskModel.description,
        isCompleted: taskModel.isCompleted,
      );
    }).toList();
  }

  @override
  Future<void> addTask(Task task) async {
    final taskModel = TaskModel(
      title: task.title,
      description: task.description ?? '',
      isCompleted: task.isCompleted,
    );
    await _taskBox.add(taskModel);
  }

  @override
  Future<void> updateTask(Task task) async {
    final taskModelIndex = _taskBox.values
        .toList()
        .indexWhere((taskModel) => taskModel.title == task.title);
    if (taskModelIndex != -1) {
      final taskModel = TaskModel(
        title: task.title,
        description: task.description ?? '',
        isCompleted: task.isCompleted,
      );
      await _taskBox.putAt(taskModelIndex, taskModel);
    }
  }

  @override
  Future<void> deleteTask(Task task) async {
    final taskModelIndex = _taskBox.values
        .toList()
        .indexWhere((taskModel) => taskModel.title == task.title);
    if (taskModelIndex != -1) {
      await _taskBox.deleteAt(taskModelIndex);
    }
  }
}

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';

import '../../domain/entities/task.dart';
import '../../domain/repositories/task_repository.dart';

class TaskCubit extends Cubit<List<Task>> {
  final TaskRepository _repository;

  TaskCubit(this._repository) : super([]) {
    _loadTasks(); // Carregar tarefas salvas ao inicializar o Cubit
  }

  Future<void> _loadTasks() async {
    try {
      final tasks = await _repository.getTasks();
      emit(tasks);
    } catch (e) {
      debugPrint('Erro ao carregar tarefas: $e');
    }
  }

  Future<void> addTask(Task task) async {
    try {
      await _repository.addTask(task);
      emit([...state, task]); // Atualiza o estado adicionando a nova tarefa
    } catch (e) {
      debugPrint('Erro ao adicionar tarefa: $e');
    }
  }

  Future<void> updateTask(Task updatedTask) async {
    try {
      await _repository.updateTask(updatedTask);
      final updatedTasks = state.map((task) {
        return task.title == updatedTask.title ? updatedTask : task;
      }).toList();
      emit(updatedTasks); // Atualiza o estado com a tarefa editada
    } catch (e) {
      debugPrint('Erro ao atualizar tarefa: $e');
    }
  }

  Future<void> deleteTask(Task task) async {
    try {
      await _repository.deleteTask(task);
      emit(state.where((t) => t.title != task.title).toList());
    } catch (e) {
      debugPrint('Erro ao excluir tarefa: $e');
    }
  }
}

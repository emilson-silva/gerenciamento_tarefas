import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gerenciamento_tarefas/features/task/domain/entities/task.dart';
import 'package:gerenciamento_tarefas/features/task/presentation/cubit/task_cubit.dart';
import 'package:gerenciamento_tarefas/features/task/presentation/pages/add_task_page.dart';
import 'package:gerenciamento_tarefas/features/task/presentation/pages/edit_task_page.dart';

class TaskListPage extends StatelessWidget {
  const TaskListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de Tarefas'),
      ),
      body: BlocBuilder<TaskCubit, List<Task>>(
        builder: (context, tasks) {
          return tasks.isEmpty
              ? const Center(
                  child: Text('Nenhuma tarefa encontarda'),
                )
              : ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    final task = tasks[index];
                    return ListTile(
                      title: Text(task.title),
                      subtitle: task.description != null
                          ? Text(task.description ?? 'Sem descrição disponível')
                          : null,
                      trailing: Checkbox(
                        value: task.isCompleted,
                        onChanged: (value) {
                          context.read<TaskCubit>().updateTask(
                                Task(
                                  title: task.title,
                                  description: task.description,
                                  isCompleted: value ?? false,
                                ),
                              );
                        },
                      ),
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => EditTaskPage(task: task),
                        ),
                      ),
                    );
                  },
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => const AddTaskPage(),
          ),
        ),
        child: const Icon(Icons.add),
      ),
      );
  }
}
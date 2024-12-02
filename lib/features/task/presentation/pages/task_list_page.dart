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
                  child: Text('Nenhuma tarefa encontrada'),
                )
              : Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 8.0,
                      mainAxisSpacing: 8.0,
                    ),
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      final task = tasks[index];
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        elevation: 4.0,
                        child: InkWell(
                          onTap: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => EditTaskPage(task: task),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  task.title,
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8.0),
                                if (task.description != null)
                                  Text(
                                    task.description ?? 'Sem descrição disponível',
                                    style: const TextStyle(fontSize: 14.0),
                                  ),
                                const Spacer(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        task.isCompleted ? 'Concluída' : 'Pendente',
                                        style: TextStyle(
                                          color: task.isCompleted ? Colors.green : Colors.red,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Checkbox(
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
                                        IconButton(
                                          icon: const Icon(Icons.delete),
                                          onPressed: () {
                                            context.read<TaskCubit>().deleteTask(task);
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
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
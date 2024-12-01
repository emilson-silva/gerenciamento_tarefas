import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gerenciamento_tarefas/features/task/domain/entities/task.dart';
import 'package:gerenciamento_tarefas/features/task/presentation/cubit/task_cubit.dart';

class AddTaskPage extends StatelessWidget {
  const AddTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Adicionar Tarefa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(
                  labelText: 'Título',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira um título';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: descriptionController,
                decoration: InputDecoration(
                  labelText: 'Descrição',
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState?.validate() ?? false) {
                    final task = Task(
                      title: titleController.text,
                      description: descriptionController.text,
                      isCompleted: false,
                    );
                    context.read<TaskCubit>().addTask(task);
                    Navigator.of(context).pop();
                  }
                },
                child: const Text('Adicionar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
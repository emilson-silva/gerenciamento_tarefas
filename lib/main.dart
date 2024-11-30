import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gerenciamento_tarefas/features/task/data/models/task_model.dart';
import 'package:gerenciamento_tarefas/features/task/data/repositories/task_repository_impl.dart';
import 'package:gerenciamento_tarefas/features/task/presentation/cubit/task_cubit.dart';
import 'package:gerenciamento_tarefas/features/task/presentation/pages/task_list_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Inicializa o Hive e registra o adaptador
  await Hive.initFlutter();
  Hive.registerAdapter(TaskModelAdapter());
  final taskBox = await Hive.openBox<TaskModel>('taskBox');

  final repository = TaskRepositoryImpl(taskBox);

  runApp(
    MyApp(repository: repository),
  );
}

class MyApp extends StatelessWidget {
  final TaskRepositoryImpl repository;

  const MyApp({Key? key, required this.repository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gerenciador de Tarefas',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BlocProvider(
        create: (_) => TaskCubit(repository),
        child: const TaskListPage(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:labs/screens/todo_list_screen.dart';

import 'models/task_model.dart';
import 'models/task_storage_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // final taskStorage = TaskStorage();
  // await taskStorage.writeTasks(tasks);
  //
  // final tasks = [
  //   Task(title: 'Task 1'),
  //   Task(title: 'Task 2', isCompleted: true),
  // ];
  //
  // // Сохранение задач в файл
  // await taskStorage.writeTasks(tasks);
  // print('Tasks saved to file');

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TodoListScreen(),
    );
  }
}

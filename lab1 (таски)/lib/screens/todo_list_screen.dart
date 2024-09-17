import 'package:flutter/material.dart';
import '../models/task_model.dart';
import '../models/task_storage_model.dart';
import '../widgets/task_tile.dart';

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final taskStorage = TaskStorage();
  List<Task> tasks = [];

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  Future<void> _loadTasks() async {
    final loadedTasks = await taskStorage.readTasks();
    setState(() {
      tasks = loadedTasks;
    });
  }

  void _deleteTask(Task task) {
    setState(() {
      tasks.remove(task);
    });
  }

  Future<void> _saveTasks() async {
    await taskStorage.writeTasks(tasks);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List'),
        actions: <Widget>[
          FloatingActionButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  String newTaskTitle = '';
                  return AlertDialog(
                    title: const Text('Add Task'),
                    content: TextField(
                      onChanged: (value) {
                        newTaskTitle = value;
                      },
                    ),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            tasks.add(Task(title: newTaskTitle));
                          });
                          Navigator.pop(context);
                        },
                        child: const Text('Add'),
                      ),
                    ],
                  );
                },
              );
              // print('Кнопка нажата!');
            },
            mini: true,
            child: const Icon(Icons.add),
            // backgroundColor: Colors.blue,
          ),
        ],
      ),
      body: tasks.isEmpty
          ? const Center(child: Text('List is empty'))
          : ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return TaskTile(
                  task: tasks[index],
                  onDelete: _deleteTask,
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _saveTasks();

          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Задачи успешно сохранены!'),
              duration: Duration(seconds: 2),
            ),
          );
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}

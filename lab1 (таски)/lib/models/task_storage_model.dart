import 'dart:convert';
import 'dart:io';
import 'package:labs/models/task_model.dart';
import 'package:path_provider/path_provider.dart';

class TaskStorage {
  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    // print('$path/tasks.json');
    return File('$path/tasks.json');
  }

  Future<List<Task>> readTasks() async {
    try {
      final file = await _localFile;
      final contents = await file.readAsString();
      final List<dynamic> jsonData = json.decode(contents);
      return jsonData.map((json) => Task.fromJson(json)).toList();
    } catch (e) {
      return [];
    }
  }

  Future<File> writeTasks(List<Task> tasks) async {
    final file = await _localFile;
    final String jsonString = json.encode(tasks.map((task) => task.toJson()).toList());
    return file.writeAsString(jsonString);
  }
}

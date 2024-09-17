import 'package:flutter/material.dart';
import '../models/task_model.dart';

class TaskTile extends StatefulWidget {
  final Task task;
  final Function(Task) onDelete;

  TaskTile({required this.task, required this.onDelete});

  @override
  _TaskTileState createState() => _TaskTileState();
}


class _TaskTileState extends State<TaskTile> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.task.title),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Checkbox(
            value: widget.task.isCompleted,
            onChanged: (value) {
              setState(() {
                widget.task.isCompleted = value!;
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              setState(() {
                widget.onDelete(widget.task);
              });
            },
          ),
        ],
      ),
    );
  }
}

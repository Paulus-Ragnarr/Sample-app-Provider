import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:my_app_provider/model/task_model.dart';
import 'package:my_app_provider/provider/todo_provider.dart';
import 'package:provider/provider.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key, required UnmodifiableListView<TodoModel> task});

  @override
  Widget build(BuildContext context) {
    final task = Provider.of<TodoProvider>(context);

    return ListView.builder(
      itemCount: task.allTasks.length,
      itemBuilder: (context, index) => ListTile(
        leading: Checkbox(
          value: task.allTasks[index].completed,
          onChanged: ((_) => task.toogleTask(task.allTasks[index])),
        ),
        title: Text(task.allTasks[index].tasktitle),
        trailing: IconButton(
          onPressed: () {
            task.deleteTask(task.allTasks[index]);
          },
          icon: const Icon(Icons.delete),
        ),
      ),
    );
  }
}

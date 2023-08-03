import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:my_app_provider/model/task_model.dart';

class TodoProvider extends ChangeNotifier {
  final List<TodoModel> _tasks = [];

  UnmodifiableListView<TodoModel> get allTasks => UnmodifiableListView(_tasks);

  void addTask(String task) {
    _tasks.add(TodoModel(tasktitle: task, completed: false));
    notifyListeners();
  }

  void toogleTask(TodoModel task) {
    final taskIndex = _tasks.indexOf(task);

    _tasks[taskIndex].toogleCompleted();
  }

  void deleteTask(TodoModel task) {
    _tasks.remove(task);
    notifyListeners();
  }
}

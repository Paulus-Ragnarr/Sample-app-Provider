import 'package:flutter/material.dart';
import 'package:my_app_provider/provider/todo_provider.dart';
import 'package:my_app_provider/ui/views/widgets/todo_list.dart';
import 'package:provider/provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("ToDo App"),
      ),
      body: Consumer<TodoProvider>(
        builder: (context, value, child) {
          return TodoList(task: value.allTasks);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/add');
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.add_outlined),
      ),
    );
  }
}

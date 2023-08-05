import 'package:flutter/material.dart';
import 'package:my_app_provider/provider/todo_provider.dart';
import 'package:provider/provider.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final _textFieldController = TextEditingController();
  String newTask = '';

  @override
  void initState() {
    super.initState();
    _textFieldController.addListener(() {
      newTask = _textFieldController.text;
    });
  }

  @override
  void dispose() {
    _textFieldController.dispose();
    super.dispose();
  }

  void _submit() {
    Provider.of<TodoProvider>(context, listen: false).addTask(newTask);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text("Add new task"),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            // autofocus: true,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Input your new task",
            ),
            controller: _textFieldController,
            onSubmitted: (value) => _submit(),
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: _submit,
            style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.green),
            ),
            child: const Text(
              "Submit",
              style: TextStyle(
                fontSize: 20,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

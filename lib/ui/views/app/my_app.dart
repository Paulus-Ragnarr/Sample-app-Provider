import 'package:flutter/material.dart';
import 'package:my_app_provider/provider/todo_provider.dart';
import 'package:my_app_provider/ui/views/tasks/addtask_view.dart';
import 'package:provider/provider.dart';
import '../homepage/home_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoProvider(),
      child: MaterialApp(
        title: 'Flutter',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeView(),
        routes: {
          '/add': (context) => const AddTask(),
        },
      ),
    );
  }
}

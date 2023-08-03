class TodoModel {
  final String tasktitle;
  bool completed;

  TodoModel({required this.tasktitle, this.completed = false});

  void toogleCompleted() {
    completed = !completed;
  }
}

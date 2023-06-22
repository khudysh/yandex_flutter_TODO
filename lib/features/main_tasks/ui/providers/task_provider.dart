import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Todo {
  Todo({
    required this.id,
    required this.description,
    required this.completed,
    required this.importance,
    this.deadline
  });

  int id;
  String description;
  bool completed;
  String importance;
  DateTime? deadline;
}

class TodosNotifier extends ChangeNotifier {
  final todos = <Todo>[];
  int todosCompleted = 0;
  bool showCompleted = true;
  int globalId = 0;

  static const List<DropdownMenuItem<String>>  menuItems = [
     DropdownMenuItem(value: "Нет", child: Text("Нет")),
     DropdownMenuItem(value: "Низкая", child: Text("Низкая")),
     DropdownMenuItem(
        value: "Высокая",
        child: Text(
          "!! Высокая",
          style: TextStyle(color: Colors.red),
        )),
  ];

  void toggleShowCompleted() {
    showCompleted = !showCompleted;
    notifyListeners();
  }

  void addTodo(Todo todo) {
    todos.add(todo);
    globalId += 1;
    notifyListeners();
  }

  void removeTodo(int todoId) {
    Todo todo = todos.firstWhere((element) => element.id == todoId);
    if (todo.completed) todosCompleted -= 1;
    todos.remove(todo);
    notifyListeners();
  }

  void toggleTodo(int todoId) {
    final todo = todos.firstWhere((todo) => todo.id == todoId);
    if (todo.completed) {
      todo.completed = !todo.completed;
      todosCompleted -= 1;
    } else {
      todo.completed = !todo.completed;
      todosCompleted += 1;
    }
    notifyListeners();
  }
}

final todosProvider = ChangeNotifierProvider<TodosNotifier>((ref) {
  return TodosNotifier();
});

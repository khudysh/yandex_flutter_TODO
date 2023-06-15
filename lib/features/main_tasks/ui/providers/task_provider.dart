import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Todo {
  Todo({
    required this.id,
    required this.description,
    required this.completed,
  });

  int id;
  String description;
  bool completed;
}

class TodosNotifier extends ChangeNotifier {
  final todos = <Todo>[];
  int todosCompleted = 0;

  void addTodo(Todo todo) {
    todos.add(todo);
    notifyListeners();
  }

  void removeTodo(int todoId) {
    todos.remove(todos.firstWhere((element) => element.id == todoId));
    notifyListeners();
  }

  void toggle(int todoId) {
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

// lib/view_models/todo_view_model.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/todo.dart';

class TodoViewModel extends StateNotifier<List<Todo>> {
  TodoViewModel() : super([]);

  void addTodo(String title) {
    state = [...state, Todo(title: title)];
  }

  void toggleTodoStatus(int index) {
    state[index].toggleDone();
    state = [...state];
  }

  void removeTodo(int index) {
    state = state.where((todo) => state.indexOf(todo) != index).toList();
  }
}

final todoProvider = StateNotifierProvider<TodoViewModel, List<Todo>>((ref) => TodoViewModel());
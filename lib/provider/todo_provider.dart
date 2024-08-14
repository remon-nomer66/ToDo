// lib/provider/todo_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../view_model/todo_view_model.dart';
import '../model/todo.dart';

final todoProvider = StateNotifierProvider<TodoViewModel, List<Todo>>((ref) => TodoViewModel());
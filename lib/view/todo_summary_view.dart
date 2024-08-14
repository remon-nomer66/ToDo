// lib/view/todo_summary_view.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../provider/todo_provider.dart';

class TodoSummaryView extends ConsumerWidget {
  const TodoSummaryView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoProvider);
    final completedTodos = todos.where((todo) => todo.isDone == true).length;
    final totalTodos = todos.length;
    final completionRate = totalTodos > 0 ? (completedTodos / totalTodos * 100).toStringAsFixed(1) : '0.0';

    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDo Summary'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Completed Tasks: $completedTodos'),
            Text('Total Tasks: $totalTodos'),
            Text('Completion Rate: $completionRate%'),
          ],
        ),
      ),
    );
  }
}
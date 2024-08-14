// lib/component/todo_tile.dart
import 'package:flutter/material.dart';
import '../model/todo.dart';

class TodoTile extends StatelessWidget {
  final Todo todo;

  const TodoTile({required this.todo, super.key});  // 修正: keyをsuper parameterとして扱う

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(todo.title),
      trailing: Checkbox(
        value: todo.isDone,
        onChanged: (bool? value) {
          // TODO: Implement checkbox logic
        },
      ),
    );
  }
}
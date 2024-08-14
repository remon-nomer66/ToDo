import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../view_models/todo_view_model.dart';
import 'add_todo_view.dart';

class TodoListView extends ConsumerWidget {
  const TodoListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final todos = ref.watch(todoProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('ToDo List'),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          final todo = todos[index];
          return ListTile(
            title: Text(
              todo.title,
              style: TextStyle(
                decoration: todo.isDone ? TextDecoration.lineThrough : null,
              ),
            ),
            trailing: Checkbox(
              value: todo.isDone,
              onChanged: (_) {
                ref.read(todoProvider.notifier).toggleTodoStatus(index);
              },
            ),
            onLongPress: () {
              ref.read(todoProvider.notifier).removeTodo(index);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTodoView()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
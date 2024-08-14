// lib/router/app_router.dart
import 'package:flutter/material.dart';
import '../view/todo_list_view.dart';
import '../view/todo_summary_view.dart';
import '../view/add_todo_view.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const TodoListView());
      case '/summary':
        return MaterialPageRoute(builder: (_) => const TodoSummaryView());
      case '/add':
        return MaterialPageRoute(builder: (_) => AddTodoView());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
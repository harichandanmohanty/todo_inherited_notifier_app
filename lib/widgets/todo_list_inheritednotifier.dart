import 'package:flutter/material.dart';
import '../app_state.dart';

class TodoListInheritedNotifier extends InheritedNotifier<AppStateNotifier> {
  const TodoListInheritedNotifier({
    super.key,
    required super.child,
    required super.notifier,
  });

  static AppStateNotifier of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<TodoListInheritedNotifier>()!.notifier!;
  }
}

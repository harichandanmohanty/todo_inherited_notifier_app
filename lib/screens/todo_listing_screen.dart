import 'package:flutter/material.dart';
import 'package:todo_inherited_notifier_app/app_state.dart';
import 'package:todo_inherited_notifier_app/models/todo_item_model.dart';
import 'package:todo_inherited_notifier_app/widgets/todo_item_widget.dart';
import 'package:todo_inherited_notifier_app/widgets/todo_list_inherited_widget.dart';

class TodoListScreen extends StatelessWidget {
  const TodoListScreen({super.key,});


  bool visibilityCheck(TodoItem item, DropdownMenuValues filterValue) {
    switch (filterValue) {
      case DropdownMenuValues.pending:
        return !item.isCompleted;
      case DropdownMenuValues.completed:
        return item.isCompleted;
      case DropdownMenuValues.all:
      default:
        return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    var index = 0;
    return Container(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: TodoListInheritedNotifier.of(context).todoList.map((_) => buildTodoItemVisibility(context, index++)).toList(),
      ),
    );
  }

  Visibility buildTodoItemVisibility(BuildContext context, int index) {
    final AppStateNotifier appStateNotifier = TodoListInheritedNotifier.of(context);
    final todoObj = appStateNotifier.todoList[index];
    final filterValue = appStateNotifier.filterValue;
    return Visibility(
      visible: visibilityCheck(todoObj, filterValue),
      child: TodoItemWidget(
        index: index,
      ),
    );
  }
}

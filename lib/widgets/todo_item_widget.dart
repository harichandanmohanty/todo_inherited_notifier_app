import 'package:flutter/material.dart';
import 'package:todo_inherited_notifier_app/app_state.dart';
import 'package:todo_inherited_notifier_app/models/todo_item_model.dart';
import 'package:todo_inherited_notifier_app/screens/todo_item_details_screen.dart';
import 'package:todo_inherited_notifier_app/widgets/todo_list_inheritednotifier.dart';

class TodoItemWidget extends StatelessWidget {
  const TodoItemWidget({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    AppStateNotifier appStateNotifier = TodoListInheritedNotifier.of(context);
    TodoItem todoObj = appStateNotifier.todoList[index];
    return Container(
      decoration: BoxDecoration(color: const Color.fromARGB(30, 50, 0, 200), borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => TodoListInheritedNotifier(
              notifier: appStateNotifier,
              child: TodoItemDetailScreen(
                todoObj: todoObj,
                index: index,
              ),
            ),
          ));
        },
        leading: InkWell(
          onTap: () {
            appStateNotifier.toggleTodoStatus(todoObj);
          },
          child: todoObj.isCompleted ? const Icon(Icons.check_box_outlined) : const Icon(Icons.check_box_outline_blank),
        ),
        title: Text(
          todoObj.title,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(decoration: todoObj.isCompleted ? TextDecoration.lineThrough : TextDecoration.none),
        ),
        subtitle: Text(
          todoObj.description,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(decoration: todoObj.isCompleted ? TextDecoration.lineThrough : TextDecoration.none),
        ),
        trailing: InkWell(
          onTap: () {
            appStateNotifier.deleteTodoItem(todoObj);
          },
          child: const Icon(Icons.delete_outline),
        ),
      ),
    );
  }
}

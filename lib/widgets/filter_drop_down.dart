import 'package:flutter/material.dart';
import 'package:todo_inherited_notifier_app/app_state.dart';
import 'package:todo_inherited_notifier_app/models/todo_item_model.dart';
import 'package:todo_inherited_notifier_app/widgets/todo_list_inherited_widget.dart';

class FilterDropDown extends StatelessWidget {
  const FilterDropDown({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    AppStateNotifier appStateNotifier = TodoListInheritedNotifier.of(context);
    return DropdownButton(
      underline: Container(
        height: 2,
        color: Colors.purpleAccent,
      ),
      borderRadius: const BorderRadius.all(Radius.circular(5)),
      value: appStateNotifier.filterValue,
      icon: const Icon(Icons.filter_alt_outlined),
      items: DropdownMenuValues.values.map((DropdownMenuValues item) {
        return DropdownMenuItem(
          value: item,
          child: Text(item.name),
        );
      }).toList(),
      onChanged: (DropdownMenuValues? value) {
        appStateNotifier.changeFilterValue(value!);
      },
    );
  }
}
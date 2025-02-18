import 'package:flutter/material.dart';
import 'package:task_manager/entities/Todo.dart';
import 'package:task_manager/ui/widgets/todo_item.dart';

class DoneTodoList extends StatelessWidget {
  const DoneTodoList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return TodoItem(
          todo: Todo('Title', 'Description', DateTime.now()),
          iconButtonPressed: () {},
        );
      },
    );
  }
}

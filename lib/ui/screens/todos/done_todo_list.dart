import 'package:flutter/material.dart';
import 'package:task_manager/entities/Todo.dart';
import 'package:task_manager/ui/widgets/todo_item.dart';

class DoneTodoList extends StatelessWidget {
  const DoneTodoList(
      {super.key,
      required this.todoList,
      required this.onDeleteTodo,
      required this.onToggleTodo});

  final List<Todo> todoList;
  final Function onDeleteTodo;
  final Function onToggleTodo;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: todoList.length,
      itemBuilder: (context, index) {
        return Dismissible(
          key: UniqueKey(),
          onDismissed: (direction) {
            onDeleteTodo(index);
          },
          child: TodoItem(
            todo: todoList[index],
            iconButtonPressed: () {
              onToggleTodo(index);
            },
          ),
        );
      },
    );
  }
}

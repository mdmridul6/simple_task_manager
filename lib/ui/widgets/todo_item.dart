import 'package:flutter/material.dart';
import 'package:task_manager/entities/Todo.dart';

class TodoItem extends StatelessWidget {
  const TodoItem(
      {super.key, required this.todo, required this.iconButtonPressed});

  final Todo todo;
  final VoidCallback iconButtonPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: _getCardTintColor(todo.isDone),
      color: _getCardBGColor(todo.isDone),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      elevation: 3,
      child: ListTile(
        title: Text(
          todo.title,
          style: TextStyle(
            fontSize: 16,
            decoration: _getTextDecoration(todo.isDone),
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(todo.description),
            Text(todo.time.toString()),
          ],
        ),
        trailing: _buildRoundedIconButton(todo.isDone),
      ),
    );
  }

  Widget _buildRoundedIconButton(bool isDone) {
    return GestureDetector(
      onTap: iconButtonPressed,
      child: CircleAvatar(
        child: Icon(
          _getIcon(isDone),
        ),
      ),
    );
  }

  IconData _getIcon(bool isDone) {
    return isDone ? Icons.check : Icons.clear;
  }

  TextDecoration? _getTextDecoration(bool isDone) {
    return isDone ? TextDecoration.lineThrough : null;
  }

  Color? _getCardTintColor(bool isDone) {
    return isDone ? Colors.green : null;
  }

  Color? _getCardBGColor(bool isDone) {
    return isDone ? Colors.green.shade100 : null;
  }
}

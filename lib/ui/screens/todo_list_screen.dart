import 'package:flutter/material.dart';
import 'package:task_manager/entities/Todo.dart';
import 'package:task_manager/ui/screens/add_new_todo_screen.dart';
import 'package:task_manager/ui/screens/todos/all_todo_list.dart';
import 'package:task_manager/ui/screens/todos/done_todo_list.dart';
import 'package:task_manager/ui/screens/todos/undone_todo_list.dart';

class TodoListScreen extends StatefulWidget {
  const TodoListScreen({super.key});

  @override
  State<TodoListScreen> createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final List<Todo> _allTodoList = [];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Todo List'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'All'),
              Tab(text: 'Undone'),
              Tab(text: 'Done'),
            ],
          ),
        ),
        body: TabBarView(children: [
          AllTodoList(
            todoList: _allTodoList,
            onDeleteTodo: _onDeleteNewTodo,
            onToggleTodo: _onToggleTodo,
          ),
          UndoneTodoList(
            todoList:
                _allTodoList.where((item) => item.isDone == false).toList(),
            onDeleteTodo: _onDeleteNewTodo,
            onToggleTodo: _onToggleTodo,
          ),
          DoneTodoList(
            todoList:
                _allTodoList.where((item) => item.isDone == true).toList(),
            onDeleteTodo: _onDeleteNewTodo,
            onToggleTodo: _onToggleTodo,
          ),
        ]),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddNewTodoScreen(
                  addNewTodo: _onAddNewTodoList,
                ),
              ),
            );
          },
          label: const Text('Add'),
          icon: const Icon(Icons.add),
          tooltip: 'Add Task',
        ),
      ),
    );
  }

  void _onAddNewTodoList(Todo todo) {
    _allTodoList.add(todo);
    if (mounted) {
      setState(() {});
    }
  }

  void _onDeleteNewTodo(int index) {
    _allTodoList.removeAt(index);
    if (mounted) {
      setState(() {});
    }
  }

  void _onToggleTodo(int index) {
    _allTodoList[index].isDone = !_allTodoList[index].isDone;
    if (mounted) {
      setState(() {});
    }
  }
}

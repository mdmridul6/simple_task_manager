import 'package:flutter/material.dart';
import 'package:task_manager/entities/Todo.dart';

class AddNewTodoScreen extends StatefulWidget {
  const AddNewTodoScreen({super.key, required this.addNewTodo});

  final Function addNewTodo;

  @override
  State<AddNewTodoScreen> createState() => _AddNewTodoScreenState();
}

class _AddNewTodoScreenState extends State<AddNewTodoScreen> {
  final TextEditingController _titleTEController = TextEditingController();
  final TextEditingController _descriptionTEController =
      TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add new todo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleTEController,
                decoration: const InputDecoration(
                  labelText: 'Title',
                  hintText: 'Enter the title',
                ),
                validator: (String? value) {
                  if (value?.trim().isEmpty ?? true) {
                    return 'Enter the description';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
                controller: _descriptionTEController,
                decoration: const InputDecoration(
                  labelText: 'Description',
                  hintText: 'Enter the description',
                ),
                maxLength: 200,
                validator: (String? value) {
                  if (value?.trim().isEmpty ?? true) {
                    return 'Enter the description';
                  } else {
                    return null;
                  }
                },
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Todo todo = Todo(_titleTEController.text,
                          _descriptionTEController.text, DateTime.now());
                      Navigator.pop(context, true);
                      widget.addNewTodo(todo);
                    } else {
                      return;
                    }
                  },
                  child: const Text('Add'))
            ],
          ),
        ),
      ),
    );
  }
}

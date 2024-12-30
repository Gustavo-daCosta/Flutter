/*

ToDo VIEW: responsible for UI

- use BlocBuilder (esse não sei como funciona)

*/

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/domain/models/todo.dart';
import 'package:todo/presentation/todo_cubit.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key});

  // show dialog box for user to type
  void _showAddTodoBox(BuildContext context) {
    final todoCubit = context.read<TodoCubit>();
    final textController = TextEditingController();

    showDialog(
      context: context,
      builder:(context) => AlertDialog(
        content: TextField(controller: textController),
        actions: [
          // Cancel Button
          TextButton(
            onPressed: () => Navigator.of(context).pop,
            child: const Text('Cancel'),
          ),

          // Add Button
          TextButton(
            onPressed: () {
              todoCubit.addTodo(textController.text);
              Navigator.of(context).pop();
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // todo cubit
    final todoCubit = context.read<TodoCubit>();

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _showAddTodoBox(context),
      ),

      body: BlocBuilder<TodoCubit, List<Todo>>(
        builder: (context, todos) => ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            // get individual todos from the list
            final todo = todos[index];

            // List Tile UI
            return ListTile(
              // text
              title: Text(todo.text),

              // check box
              leading: Checkbox(
                value: todo.isCompleted,
                onChanged: (value) => todoCubit.toogleCompletion(todo),
              ),

              // delete button
              trailing: IconButton(
                icon: const Icon(Icons.cancel),
                onPressed: () => todoCubit.deleteTodo(todo),
              ),
            );
          },
        ),
      ),
    );
  }
}

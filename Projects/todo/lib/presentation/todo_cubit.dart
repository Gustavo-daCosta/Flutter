/*

ToDo CUBIT - simple state management

Each cubit is a list of ToDos

*/

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/domain/models/todo.dart';
import 'package:todo/domain/repository/todo_repo.dart';


class TodoCubit extends Cubit<List<Todo>> {
  // Reference the repo
  final TodoRepo todoRepo;

  // Constructor initializes the cubit with an empty list
  TodoCubit(this.todoRepo) : super([]) {
    loadTodos();
  }

  // Load
  Future<void> loadTodos() async {
    // fetch list
    final todoList = await todoRepo.getTodos();

    // emit the fetch list as the new state
    emit(todoList);
  }

  // Add
  Future<void> addTodo(String text) async {
    // create a new todo with unique Id
    final newTodo = Todo(id: DateTime.now().millisecondsSinceEpoch, text: text);

    // save the new todo to repo
    await todoRepo.addTodo(newTodo);

    // re-load
    loadTodos();
  }

  // Delete
  Future<void> deleteTodo(Todo todo) async {
    // delete the provided todo from repo
    await todoRepo.deleteTodo(todo);

    // re-load
    loadTodos();
  }

  // Toggle
  Future<void> toogleCompletion(Todo todo) async {
    // Toggle completion of todo
    final updatedTodo = todo.toggleCompletion();

    // Update the todo
    await todoRepo.updateTodo(updatedTodo);

    // re-load
    loadTodos();
  }
}

/** Repositório To Do
 * 
 * Definição do que o app pode fazer
 * 
 */

import 'package:todo/domain/models/todo.dart';

abstract class TodoRepo {
  // Get List of ToDo's
  Future<List<Todo>> getTodos(); // Future é a forma do Flutter de utilizar async

  // Add a new ToDo
  Future<void> addTodo(Todo todo);

  // Update an existing ToDo
  Future<void> updateTodo(Todo todo);

  // Delete a ToDo
  Future<void> deleteTodo(Todo todo);
}

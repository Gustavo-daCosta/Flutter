import 'package:todo/data/models/isar_todo.dart';
import 'package:todo/domain/models/todo.dart';
import 'package:todo/domain/repository/todo_repo.dart';
import 'package:isar/isar.dart';

/// ISAR ToDo repo
/// 
/// Database repo
/// 
/// This implements the todo repo and handless storing, retrieving, updating, deleting in the isar database


class IsarTodoRepo implements TodoRepo {
  final Isar db; // database

  IsarTodoRepo(this.db);

  // get ToDos
  @override
  Future<List<Todo>> getTodos() async {
    // fetch from db
    final todos = await db.todoIsars.where().findAll();

    return todos.map((todoIsar) => todoIsar.toDomain()).toList();
  }

  // add ToDo
  @override
  Future<void> addTodo(Todo todo) async {
    // Convert todo object into isar todo
    final todoIsar = TodoIsar.fromDomain(todo);

    // so that we can store it in our isar database
    return db.writeTxn(() => db.todoIsars.put(todoIsar));
  }

  // update ToDo
  @override
  Future<void> updateTodo(Todo todo) { // Por alguma razão este método não é assíncrono, ver sobre
    // Convert todo object into isar todo
    final todoIsar = TodoIsar.fromDomain(todo);

    // so that we can store it in our isar database
    return db.writeTxn(() => db.todoIsars.put(todoIsar));
  }

  // delete ToDo
  @override
  Future<void> deleteTodo(Todo todo) async => db.writeTxn(() => db.todoIsars.delete(todo.id));
}

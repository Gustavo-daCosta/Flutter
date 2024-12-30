/** ISAR To Do Model
 * 
 * Converts todo model into isar todo model that we can store in our isar db (consiste nos models que seguem as tabelas do banco de dados)
 * 
 */

import 'package:isar/isar.dart';
import 'package:todo/domain/models/todo.dart';

// to generate isar todo object, run: dart run build_runner build
part 'isar_todo.g.dart';

@collection
class TodoIsar {
  Id id = Isar.autoIncrement;
  late String text;
  late bool isCompleted;

  // Convert isar object -> pure todo object to use in our app
  Todo toDomain() {
    return Todo(
      id: id,
      text: text,
      isCompleted: isCompleted,
    );
  }

  // Convert pure todo object -> isar object to store in isar database
  static TodoIsar fromDomain(Todo todo) {
    return TodoIsar()
      ..id = todo.id
      ..text = todo.text
      ..isCompleted = todo.isCompleted;
  }
}
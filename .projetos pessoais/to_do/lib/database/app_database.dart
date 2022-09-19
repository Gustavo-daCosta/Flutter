import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:to_do/database/task_dao.dart';

Future<Database> getDataBase() async {
  final String path = join(await getDatabasesPath(), 'todo.db');
  return openDatabase(
    path, onCreate: ((db, version) {
      db.execute(TaskDao.tableSql);
    }),
    version: 1,
    onDowngrade: onDatabaseDowngradeDelete,
  );
}
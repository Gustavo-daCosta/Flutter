import 'package:to_do/database/app_database.dart';
import 'package:to_do/models/task.dart';
import 'package:sqflite/sqflite.dart';

class TaskDao {
  static const String tableSql = "CREATE TABLE $_tableName("
    "$_id INTEGER PRIMARY KEY, "
    "$_title TEXT, "
    // Arrumar o target Data antes de utilizar o banco de dados no aplicativo
    "$_targetData STRING, "
    "$_color INTEGER, "
    "$_icon INTEGER)";
  

  static const String _tableName = "";
  static const String _id = "id";
  static const String _title = "title";
  static const String _targetData = "target_data";
  static const String _color = "color";
  static const String _icon = "icon";
}

/* 
Icons.add.codePoint
Colors.white.value
*/
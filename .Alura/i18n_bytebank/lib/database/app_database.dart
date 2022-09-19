import 'package:i18n_bytebank/database/dao/contact_dao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> getDataBase() async {
  final String path = join(await getDatabasesPath(), 'bytebank.db');
  return openDatabase(
    path, onCreate: ((db, version) {
      db.execute(ContactDao.tableSql);
    }),
    // onUpgrade: (db, oldVersion, newVersion) {},
    version: 1,
    onDowngrade: onDatabaseDowngradeDelete,
  );
}

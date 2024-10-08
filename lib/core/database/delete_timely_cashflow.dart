import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<void> deleteTimelyCashflow(int id) async {
  // Get a reference to the database.
  final dbPath = await getDatabasesPath();
  final path = join(dbPath, 'cash_planner_db.db');
  final db = await openDatabase(
    path,
    version: 1,
    onCreate: (db, version) async {
      db.execute(
          'CREATE TABLE init_cash_value( initial_cash DOUBLE, target_saving DOUBLE, time TEXT)');
      db.execute(
          'CREATE TABLE cashflow (id INTEGER PRIMARY KEY,cashflow REAL,reason TEXT, datetime TEXT)');
      db.execute(
          'CREATE TABLE timely_cashflow (id INTEGER PRIMARY KEY,timely_cashflow REAL,reason TEXT, datetime TEXT)');
    },
  );

  // Remove the Dog from the database.
  await db.delete(
    'timely_cashflow',
    // Use a `where` clause to delete a specific dog.
    where: 'id = ?',
    // Pass the Dog's id as a whereArg to prevent SQL injection.
    whereArgs: [id],
  );
}

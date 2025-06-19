import 'package:new_cash_planner/core/model/init_cash_value_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<void> updateInitCashValue(InitCashValueModel initCashValueModel) async {
  // Get a reference to the database.
  final dbPath = await getDatabasesPath();
  final path = join(dbPath, 'cash_planner_db.db');
  final db =
      await openDatabase(path, version: 1, onCreate: (db, version) async {
    db.execute(
        'CREATE TABLE init_cash_value( initial_cash DOUBLE, target_saving DOUBLE, time TEXT)');
    db.execute(
        'CREATE TABLE cashflow (id INTEGER PRIMARY KEY,cashflow REAL,reason TEXT, datetime TEXT)');
    db.execute(
        'CREATE TABLE timely_cashflow (id INTEGER PRIMARY KEY,timely_cashflow REAL,reason TEXT, datetime TEXT)');
  });

  // Update the given Dog.
  await db.update(
    'init_cash_value',
    initCashValueModel.toJson(),
    // Ensure that the Dog has a matching id.
    where: 'time = ?',
    // Pass the Dog's id as a whereArg to prevent SQL injection.
    whereArgs: [initCashValueModel.time],
  );
}

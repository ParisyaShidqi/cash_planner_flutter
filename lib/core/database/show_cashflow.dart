import 'package:new_cash_planner/core/model/cashflow_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<List<CashflowModel>> showCashflowValue() async {
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

  // Query the table for all the dogs.
  final List<Map<String, Object?>> cashflowMap = await db.query('cashflow');

  // Convert the list of each dog's fields into a list of `Dog` objects.
  return [
    for (final {
          'id': id as int,
          'cashflow': cashflow as double,
          'reason': reason as String,
          'datetime': dateTime as String
        } in cashflowMap)
      CashflowModel(
          id: id, cashflow: cashflow, reason: reason, dateTime: dateTime),
  ];
}

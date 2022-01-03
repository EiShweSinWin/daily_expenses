import 'dart:developer';
import 'dart:io';

import 'package:daily_expenses/model/expense_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;

class DatabaseHelper {
  static const _databaseName = "list.db";
  static const columnType = 'type';
  static const columnAmount = 'amount';
  static const columnReason = 'reason';
  static const columnDate = 'date';
  static const table = 'Listdb';
  static const _databaseVersion = 1;

  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  _initDatabase() async {
    String dbPath = await getDatabasesPath();
    String dataPath = p.join(dbPath, _databaseName);

    log(dataPath);

    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = p.join(documentsDirectory.path, _databaseName);
    log(path);

    return await openDatabase(dataPath,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int versopm) async {
    await db.execute('''
          CREATE TABLE $table(
  $columnType INT
  ,$columnAmount INT    
  ,$columnDate  VARCHAR(20)
  ,$columnReason TEXT

  
);
          ''');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    log("insert");
    return await db.insert(table, row,
        conflictAlgorithm: ConflictAlgorithm.replace, nullColumnHack: "");
  }

  Future<List<ExpenseModel>> queryAllExpense() async {
    Database db = await instance.database;
    final data = await db.query(table, where: '$columnType=?', whereArgs: [0]);
    final List<ExpenseModel> expenseModel =
        data.map<ExpenseModel>((e) => ExpenseModel.fromJson(e)).toList();
    log("ExpenseMoel");
    return expenseModel;
  }

  Future<List<ExpenseModel>> queryAllTotal() async {
    Database db = await instance.database;
    final data = await db.rawQuery("SELECT $columnAmount  FROM $table");
    final List<ExpenseModel> expenseTotal =
        data.map<ExpenseModel>((e) => ExpenseModel.fromJson(e)).toList();
    log("ExpenseTotal");
    return expenseTotal;
  }

  Future<List<ExpenseModel>> queryAllDatabase() async {
    Database db = await instance.database;
    final data = await db.query(table);
    final List<ExpenseModel> expenseModel =
        data.map<ExpenseModel>((e) => ExpenseModel.fromJson(e)).toList();
    log(expenseModel.toString());
    return expenseModel;
  }

  Future<List<ExpenseModel>> queryAllIncome() async {
    Database db = await instance.database;
    final data = await db.query(table, where: '$columnType=?', whereArgs: [1]);
    final List<ExpenseModel> expenseModel =
        data.map<ExpenseModel>((e) => ExpenseModel.fromJson(e)).toList();
    return expenseModel;
  }

  Future<int> delete() async {
    Database db = await instance.database;
    return await db.delete(table, where: '$columnType = ?', whereArgs: [0]);
  }
}

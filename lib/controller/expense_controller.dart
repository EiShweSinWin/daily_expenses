import 'dart:developer';

import 'package:daily_expenses/model/expense_model.dart';
import 'package:daily_expenses/service/database.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ExpenseController extends GetxController {
  final _db = DatabaseHelper.instance;
  final TextEditingController incomeamountController = TextEditingController();
  final TextEditingController incomereasonController = TextEditingController();
  final TextEditingController outcomeamountController = TextEditingController();
  final TextEditingController outcomereasonController = TextEditingController();

  RxList<ExpenseModel> incomeList = <ExpenseModel>[].obs;
  RxList<ExpenseModel> outcomeList = <ExpenseModel>[].obs;
  //RxList<ExpenseModel> sum = <ExpenseModel>[].obs;

  @override
  onInit() {
    getAllExpense();
    super.onInit();
  }

  addExpense() {
    log("addOutcome");
    DateTime now = DateTime.now();
    String datetime = DateFormat("dd.MM.yyyy hh.mm a").format(now);
    ExpenseModel expenseModel = ExpenseModel(
        type: 0,
        amount: double.parse(outcomeamountController.text),
        reason: outcomereasonController.text,
        date: datetime);
    _db.insert(expenseModel.toJson());

    getAllExpense();
  }

  addIncome() {
    log("addIncome");
    ExpenseModel expenseModel = ExpenseModel(
        type: 1,
        amount: double.parse(incomeamountController.text),
        reason: incomereasonController.text);
    _db.insert(expenseModel.toJson());
    getAllInCome();
  }

  getAllExpense() async {
    final outcome = await _db.queryAllExpense();
    log(outcome.toString());
    outcomeList.value = outcome;
    await _db.queryAllDatabase();
    // double sum = outcome
    //     .map((expense) => expense.amount!.toDouble())
    //     .fold(0, (previous, amount) => previous + amount);

    // log(sum.toString());

    log("getAllOutcome");
  }

  getAllTotal() async {
    final outcome = await _db.queryAllExpense();
    double sum = outcome
        .map((expense) => expense.amount!.toDouble())
        .fold(0, (previous, double amount) => previous + amount);

    log(sum.toString());

    return sum;
  }

  getAllInCome() async {
    final income = await _db.queryAllIncome();
    incomeList.value = income;
  }

  clear() {
    incomeamountController.clear();
    incomereasonController.clear();
  }

  deleteOutcome() async {
    await _db.delete();
    getAllExpense();
    getAllInCome();
    getAllTotal();
  }
}

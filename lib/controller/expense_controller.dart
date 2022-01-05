import 'dart:developer';

import 'package:daily_expenses/model/expense_model.dart';
import 'package:daily_expenses/service/database.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart';

class ExpenseController extends GetxController {
  final _db = DatabaseHelper.instance;
  final TextEditingController incomeamountController = TextEditingController();
  final TextEditingController incomereasonController = TextEditingController();
  final TextEditingController outcomeamountController = TextEditingController();
  final TextEditingController outcomereasonController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  RxList<ExpenseModel> incomeList = <ExpenseModel>[].obs;
  RxList<ExpenseModel> outcomeList = <ExpenseModel>[].obs;
  RxList<ExpenseModel> choosedate = <ExpenseModel>[].obs;
  //RxList<ExpenseModel> total = <ExpenseModel>[].obs;
  double totalExpense = 0.0;
  double totalAll = 0.0;
  double totalIncome = 0.0;

  @override
  onInit() {
    getAllTotalExpense();
    getAllTotalInCome();
    getAllTotal();

    super.onInit();
  }

  addExpense() {
    log("addOutcome");
    DateTime now = DateTime.now();
    String datetime = DateFormat("dd.MM.yyyy").format(now);
    ExpenseModel expenseModel = ExpenseModel(
        type: 0,
        amount: double.parse(outcomeamountController.text),
        reason: outcomereasonController.text,
        date: datetime);
    _db.insert(expenseModel.toJson());
    // totalExpense;
    getAllTotalExpense();
  }

  showDate(context) {
    showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1990),
        lastDate: DateTime(2100));
  }

  addIncome() {
    log("addIncome");
    ExpenseModel expenseModel = ExpenseModel(
        type: 1,
        amount: double.parse(incomeamountController.text),
        reason: incomereasonController.text);
    _db.insert(expenseModel.toJson());
    getAllTotalInCome();
    getAllTotal();
  }

  getAllTotalExpense() async {
    final outcome = await _db.queryAllExpense();
    log(outcome.toString());
    outcomeList.value = outcome;
    await _db.queryAllDatabase();
    double totalOutcome = outcome
        .map((expense) => expense.amount!.toDouble())
        .fold(0, (previous, amount) => previous + amount);

    log("totalExpense" + totalOutcome.toString());
    totalExpense = totalOutcome;

    //return totalExpense;
  }

  getAllTotal() async {
    final outcome = await _db.queryAllExpense();
    final income = await _db.queryAllIncome();
    double totalOutcome = outcome
        .map((expense) => expense.amount!.toDouble())
        .fold(0, (previous, amount) => previous + amount);
    double totalIncome = income
        .map((incomeAmount) => incomeAmount.amount!.toDouble())
        .fold(0, (previous, amount) => previous + amount);
    log("totalIncome" + totalIncome.toString());
    totalAll = totalIncome - (totalOutcome);
    log("getAllTotal" + totalAll.toString());
    return totalAll;
  }

  getAllTotalInCome() async {
    final income = await _db.queryAllIncome();
    incomeList.value = income;
    double tIncome = income
        .map((incomeAmount) => incomeAmount.amount!.toDouble())
        .fold(0, (previous, amount) => previous + amount);
    totalIncome = tIncome;
    log("totalIncome" + totalIncome.toString());
    return totalIncome;
  }

  clear() {
    incomeamountController.clear();
    incomereasonController.clear();
  }

  deleteOutcome() async {
    await _db.delete();
    getAllTotalExpense();
    getAllTotalInCome();
    getAllTotal();
  }
}

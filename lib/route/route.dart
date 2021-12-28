import 'package:daily_expenses/controller/binding.dart';
import 'package:daily_expenses/ui/add/add_expense/add_expense_screen.dart';
import 'package:daily_expenses/ui/add/add_income/add_income.dart';
import 'package:daily_expenses/ui/home/expense_screen/expense_screen.dart';
import 'package:daily_expenses/ui/home/home_screen.dart';
import 'package:daily_expenses/ui/home/income_screen/income_screen.dart';
import 'package:daily_expenses/ui/home/total_screen/total_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

class MyRoutes {
  static final routes = [
    GetPage(name: '/home', page: () => HomeScreen(), binding: ListBinding()),
    GetPage(
        name: '/outcome', page: () => ExpenseScreen(), binding: ListBinding()),
    GetPage(
        name: '/income', page: () => InComeScreen(), binding: ListBinding()),
    GetPage(
        name: '/addincome',
        page: () => AddIncomeScreen(),
        binding: ListBinding()),
    GetPage(
        name: '/addoutcome',
        page: () => AddExpenseScreen(),
        binding: ListBinding()),
    GetPage(name: '/total', page: () => TotalScreen(), binding: ListBinding()),
  ];
}

import 'package:daily_expenses/controller/expense_controller.dart';
import 'package:get/get.dart';

class ListBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ExpenseController());
  }
}

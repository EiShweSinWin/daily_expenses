import 'package:daily_expenses/controller/expense_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddExpenseScreen extends StatelessWidget {
  AddExpenseScreen({Key? key}) : super(key: key);
  ExpenseController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.save),
        onPressed: () {
          controller.addExpense();
          controller.clear();
          Get.back();
        },
      ),
      appBar: AppBar(
        title: const Text("Expense"),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child: TextFormField(
              controller: controller.outcomereasonController,
              decoration: const InputDecoration(
                hintText: "Reason",
                contentPadding: EdgeInsets.only(left: 8.0),
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child: TextFormField(
              controller: controller.outcomeamountController,
              decoration: const InputDecoration(
                hintText: "Amount",
                contentPadding: EdgeInsets.only(left: 8.0),
                border: OutlineInputBorder(),
              ),
            ),
          ))
        ],
      ),
    );
  }
}

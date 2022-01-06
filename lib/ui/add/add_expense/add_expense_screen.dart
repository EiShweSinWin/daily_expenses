import 'package:daily_expenses/controller/expense_controller.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AddExpenseScreen extends StatelessWidget {
  AddExpenseScreen({Key? key}) : super(key: key);
  ExpenseController controller = Get.find();
  final format = DateFormat("yyyy-MM-dd");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.save),
        onPressed: () {
          controller.getAllTotalExpense();
          controller.addExpense();
          //controller.getAllTotalExpense();
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
          // Padding(
          //     padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          //     child: DateTimeField(
          //         format: format,
          //         onShowPicker: (context, currentValue) {
          //           return showDatePicker(
          //               context: context,
          //               initialDate: currentValue ?? DateTime.now(),
          //               firstDate: DateTime(1990),
          //               lastDate: DateTime(2100));
          //         })),
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
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child: TextFormField(
              controller: controller.outcomeamountController,
              decoration: const InputDecoration(
                hintText: "Amount",
                contentPadding: EdgeInsets.only(left: 8.0),
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

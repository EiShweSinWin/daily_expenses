import 'package:daily_expenses/controller/expense_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InComeScreen extends StatelessWidget {
  InComeScreen({Key? key}) : super(key: key);
  ExpenseController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SingleChildScrollView(
      child: Container(
        padding:
            const EdgeInsets.only(top: 30, left: 25, right: 25, bottom: 40.1),
        child: Column(
          children: [
            TextFormField(
              controller: controller.incomereasonController,
              //onFieldSubmitted: controller.addIncome(),
              decoration: const InputDecoration(hintText: 'Detail'),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: controller.incomeamountController,
              // onFieldSubmitted: controller.addIncome(),
              decoration: const InputDecoration(hintText: 'Amount'),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () {
                controller.addIncome();
                controller.clear();
                controller.getAllInCome();
                Get.back();
                //  Get.toNamed('/addincome');
              },
              // child: TextButton(
              //   onPressed: () {
              //     Get.toNamed('/incomepage');
              //     controller.clear();
              //   },
              //   child: const Text('Save'),
              // ),
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    ));
  }
}

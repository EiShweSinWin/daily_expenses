import 'package:daily_expenses/controller/expense_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TotalScreen extends StatelessWidget {
  TotalScreen({Key? key}) : super(key: key);
  final ExpenseController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Total')),
        body: Column(
          children: [
            Center(
              child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: .5, horizontal: 10),
                  child: Card(
                    child: ListTile(
                      leading: Text(
                        controller.total.toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  )),
            ),
          ],
        ));

    // body: Text(controller.total.toString()),
    // );
  }
}

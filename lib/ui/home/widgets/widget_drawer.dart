import 'package:daily_expenses/controller/expense_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WidgetDrawer extends StatelessWidget {
  WidgetDrawer({Key? key}) : super(key: key);
  final ExpenseController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          ListTile(
            leading: const Icon(
              Icons.add,
              color: Colors.indigo,
            ),
            title: const Text("Add InCome"),
            onTap: () {
              Get.toNamed('/income');
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.summarize,
              color: Colors.indigo,
            ),
            title: const Text("Total"),
            onTap: () {
              Get.toNamed('/total');
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.delete,
              color: Colors.indigo,
            ),
            title: const Text(
              'Delete',
            ),
            onTap: () {
              controller.deleteOutcome();
            },
          ),
          ListTile(
            leading: Icon(
              Icons.add,
              color: Colors.indigo,
            ),
            title: const Text('Income Amount'),
            onTap: () {
              Get.toNamed('/addincome');
            },
          )
        ],
      ),
    );
  }
}

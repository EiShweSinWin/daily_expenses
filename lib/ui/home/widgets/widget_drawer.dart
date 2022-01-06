import 'package:daily_expenses/controller/expense_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

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
              Icons.money_off_csred_rounded,
              color: Colors.indigo,
            ),
            title: const Text("Balance"),
            onTap: () {
              Get.toNamed('/total');
            },
          ),
          ListTile(
            leading: const Icon(
              MdiIcons.alphaICircleOutline,
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

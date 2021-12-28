import 'package:daily_expenses/controller/expense_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class ExpenseScreen extends StatelessWidget {
  ExpenseScreen({Key? key}) : super(key: key);

  final ExpenseController controller = Get.find();
  int noteViewId = Get.arguments["idx"];
  int page = Get.arguments["page"];

  @override
  Widget build(BuildContext context) {
    var listNote = page == 1
        ? controller.outcomeList
        : page == 2
            ? controller.incomeList
            : controller.outcomeList;

    return Scaffold(
        appBar: AppBar(
          title: Text(listNote[noteViewId].amount.toString()),
          actions: [
            IconButton(
                onPressed: () {
                  Get.toNamed('/outcome', arguments: noteViewId);
                },
                icon: const Icon(MdiIcons.minus))
          ],
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  child: Text(
                    listNote[noteViewId].date.toString(),
                    style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Center(child: Text(listNote[noteViewId].reason.toString())),
          ],
        ));
  }
}

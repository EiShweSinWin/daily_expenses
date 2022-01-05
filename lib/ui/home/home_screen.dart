import 'package:daily_expenses/controller/expense_controller.dart';
import 'package:daily_expenses/model/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'widgets/widget_drawer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final ExpenseController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: WidgetDrawer(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            controller.clear();
            Get.toNamed('/addoutcome');
          },
          child: const Icon(Icons.add),
        ),
        backgroundColor: Colors.white.withOpacity(0.9),
        appBar: _myAppBar(context),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                  child: ListTile(
                leading: const Text(
                  "Total",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
                ),
                trailing: Text(
                  controller.totalExpense.toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              )),
            ),
            Expanded(
                child: Obx(
              () => ListView.builder(
                  itemCount: controller.outcomeList.length,
                  itemBuilder: (cdx, idx) {
                    return InkWell(
                        onTap: () {},
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: .5, horizontal: 10),
                              child: Card(
                                child: ListTile(
                                  leading: Text(
                                      controller.outcomeList[idx].reason
                                          .toString(),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  title: Text(controller.outcomeList[idx].date
                                      .toString()),
                                  trailing: Text(
                                    controller.outcomeList[idx].amount
                                        .toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ));
                  }),
            ))
          ],
        ));
  }

  _myAppBar(BuildContext context) {
    return AppBar(
        elevation: 0.5,
        backgroundColor: Colors.white.withOpacity(0.9),
        iconTheme: const IconThemeData(color: Colors.indigo),
        title: const Text(
          'Daily Expenses',
          style: TextStyle(color: Colors.black),
        ));
  }
}

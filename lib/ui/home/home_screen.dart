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
    DateTime now = DateTime.now();
    String datetime = DateFormat("dd.MM.yyyy ").format(now);
    String weekday = DateFormat("EEEE").format(now);
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
        appBar: AppBar(
          title: const Text('Expense'),
        ),
        body: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  datetime.toString(),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                )),
            Text(
              weekday,
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo,
                  fontSize: 20),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: ListTile(
                  leading: const Text(
                    "delete",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.indigo),
                  ),
                  trailing: const Icon(
                    Icons.delete,
                    color: Colors.redAccent,
                  ),
                  onTap: () {
                    controller.deleteOutcome();
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: ListTile(
                  leading: const Text(
                    "Total",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.indigo),
                  ),
                  trailing: Text(
                    controller.totalExpense.toString(),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            // Text(datetime.toString()),
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
                                  leading: Container(
                                    width: 30,
                                    height: 30,
                                    padding: const EdgeInsets.all(5),
                                    alignment: Alignment.center,
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.indigo),
                                    child: const FittedBox(
                                        child: Icon(
                                      Icons.arrow_downward,
                                      color: Colors.white,
                                    )),
                                  ),

                                  title: Column(
                                    children: [
                                      Text(
                                        controller.outcomeList[idx].reason
                                            .toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),

                                  // title: Text(controller.outcomeList[idx].date
                                  //     .toString()),
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
            )),
          ],
        ));
  }

  // _myAppBar(BuildContext context) {
  //   return AppBar(
  //       elevation: 0.5,
  //       backgroundColor: Colors.white.withOpacity(0.9),
  //       iconTheme: const IconThemeData(color: Colors.indigo),
  //       title: const Text(
  //         'Daily Expenses',
  //         style: TextStyle(color: Colors.white),
  //       ));
  // }
}

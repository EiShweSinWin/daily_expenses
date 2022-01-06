import 'package:daily_expenses/controller/expense_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddIncomeScreen extends StatelessWidget {
  AddIncomeScreen({Key? key}) : super(key: key);
  final ExpenseController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Income')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
                child: ListTile(
              leading: const Text(
                "Total",
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.green),
              ),
              trailing: Text(
                controller.totalIncome.toString(),
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            )),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: controller.incomeList.length,
                itemBuilder: (ctx, idx) {
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
                                        Icons.arrow_upward,
                                        color: Colors.white,
                                      ),
                                    )),
                                title: Text(
                                    controller.incomeList[idx].reason
                                        .toString(),
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold)),
                                trailing: Text(
                                  controller.incomeList[idx].amount.toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          )
                        ],
                      ));
                }),
          )
        ],
      ),
    );
  }
}

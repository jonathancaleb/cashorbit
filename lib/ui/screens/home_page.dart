import 'package:cashorbit/data/models/budget_model.dart';
import 'package:cashorbit/data/models/transaction_model.dart';
import 'package:cashorbit/routes/fab.dart';
import 'package:cashorbit/ui/components/budget_container.dart';
import 'package:cashorbit/ui/components/pie_chart.dart';
import 'package:cashorbit/ui/components/text_input.dart';
import 'package:cashorbit/ui/components/text_widgets.dart';
import 'package:cashorbit/ui/components/transaction_entry.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _incrementCounter() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(height: 100),
                Container(
                    width: 200,
                    height: 200,
                    child: Stack(
                      children: [
                        const PieChartSample3(),
                        IgnorePointer(
                          child: Center(
                            child: Container(
                              width: 90,
                              height: 90,
                              decoration: const BoxDecoration(
                                  color: Colors.black, shape: BoxShape.circle),
                            ),
                          ),
                        ),
                        IgnorePointer(
                          child: Center(
                            child: Container(
                              width: 115,
                              height: 115,
                              decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.2),
                                  shape: BoxShape.circle),
                            ),
                          ),
                        ),
                      ],
                    )),
                Container(height: 100),
                const TextInput(labelText: "labelText"),
              ],
            ),
          ),
          SliverStickyHeader(
            header: const TextHeader(
              text: "Home",
            ),
            sliver: SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 0),
              sliver: SliverList(
                delegate: SliverChildListDelegate(
                  [
                    BudgetContainer(
                      budget: Budget(
                        title: "Budget Name",
                        color: const Color(0x4F6ECA4A),
                        total: 500,
                        spent: 210,
                        endDate: DateTime.now(),
                        startDate: DateTime.now(),
                        period: "month",
                        periodLength: 10,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          SliverStickyHeader(
            header: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const TextHeader(
                  text: "Transactions",
                ),
                DateDivider(date: DateTime.now()),
              ],
            ),
            sliver: SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return TransactionEntry(
                      openPage: const OpenTestPage(),
                      transaction: Transaction(
                        title: "Uber",
                        amount: 50,
                        categoryID: "id",
                        date: DateTime.now(),
                        note: "this is a transaction",
                        tagIDs: ["id1", "id2"],
                      ),
                    );
                  },
                  childCount: 40,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                TransactionEntry(
                  openPage: const OpenTestPage(),
                  transaction: Transaction(
                    title: "",
                    amount: 50,
                    categoryID: "id",
                    date: DateTime.now(),
                    note: "this is a transaction",
                    tagIDs: ["id1", "id2"],
                  ),
                ),
                TransactionEntry(
                  openPage: const OpenTestPage(),
                  transaction: Transaction(
                    title: "Uber",
                    amount: 50,
                    categoryID: "id",
                    date: DateTime.now(),
                    note: "this is a transaction",
                    tagIDs: ["id1", "id2"],
                  ),
                ),
              ],
            ),
          ),
          // SliverPadding(
          //   padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          //   sliver: SliverGrid(
          //     gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          //       maxCrossAxisExtent: 650,
          //       mainAxisExtent: 95,
          //       mainAxisSpacing: 15,
          //       crossAxisSpacing: 15,
          //     ),
          //     delegate: SliverChildBuilderDelegate(
          //       (BuildContext context, int index) {
          //         return TransactionEntry(
          //           openPage: OpenTestPage(),
          //           transaction: Transaction(
          //             title: "Uber",
          //             amount: 50,
          //             categoryID: "id",
          //             date: DateTime.now(),
          //             note: "this is a transaction",
          //             tagIDs: ["id1", "id2"],
          //           ),
          //         );
          //       },
          //       childCount: 20,
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}

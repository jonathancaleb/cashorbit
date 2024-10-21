import 'package:cashorbit/data/models/budget_model.dart';
import 'package:cashorbit/routes/fab.dart';
import 'package:cashorbit/ui/components/budget_container.dart';
import 'package:cashorbit/ui/components/text_widgets.dart';
import 'package:cashorbit/ui/components/transaction_entry.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFont(text: "test"),
            BudgetContainer(
              budget: Budget(
                title: "Budget Name",
                color: Color(0x4F6ECA4A),
                total: 500,
                spent: 210,
                endDate: DateTime.now(),
                startDate: DateTime.now(),
                period: "month",
                periodLength: 10,
              ),
            ),
            TransactionEntry(
              openPage: OpenTestPage(),
              transaction: Transaction(
                  title: "Uber",
                  amount: 50,
                  categoryID: "id",
                  date: DateTime.now(),
                  note: "this is a transaction",
                  tagIDs: ["id1", "id2"]),
            ),
            TransactionEntry(
              openPage: OpenTestPage(),
              transaction: Transaction(
                  title: "",
                  amount: 50,
                  categoryID: "id",
                  date: DateTime.now(),
                  note: "this is a transaction",
                  tagIDs: ["id1", "id2"]),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}

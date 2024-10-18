import 'package:cashorbit/data/models/budget_model.dart';
import 'package:cashorbit/routes/fab.dart';
import 'package:cashorbit/ui/components/budget_container.dart';
import 'package:cashorbit/ui/components/text_widgets.dart';
import 'package:cashorbit/ui/components/transaction_entry.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
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
            const TextFont(text: "test"),
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
            const TransactionEntry(openPage: OpenTestPage()),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            ElevatedButton(
              onPressed: _incrementCounter, // Call the increment method here
              child: const Text('Increment Counter'),
            ),
          ],
        ),
      ),
    );
  }
}

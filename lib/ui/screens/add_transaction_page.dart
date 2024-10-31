import 'package:cashorbit/ui/components/button.dart';
import 'package:cashorbit/ui/components/text_input.dart';
import 'package:cashorbit/ui/components/text_widgets.dart';
import 'package:flutter/material.dart';

class AddTransactionPage extends StatefulWidget {
  const AddTransactionPage({super.key, required String title});

  @override
  State<AddTransactionPage> createState() => _AddTransactionPageState();
}

class _AddTransactionPageState extends State<AddTransactionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                leading: Container(),
                backgroundColor: Colors.black,
                floating: true,
                pinned: true,
                expandedHeight: 200.0,
                collapsedHeight: 65,
                flexibleSpace: const FlexibleSpaceBar(
                  titlePadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 18),
                  title: TextFont(
                    text: "Add Transaction",
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    const TextInput(labelText: "labelText"),
                  ],
                ),
              ),
              const SliverFillRemaining()
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Button(
              label: "Add Transaction",
              width: MediaQuery.of(context).size.width,
              height: 50,
              fractionScaleHeight: 0.93,
              fractionScaleWidth: 0.98,
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}

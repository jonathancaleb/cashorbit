import 'package:cashorbit/routes/fab.dart';
import 'package:cashorbit/ui/screens/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  /// This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        /// The primary color of the application.
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: MyHomePage(
          title: "test",
        ),
        floatingActionButton: const Fab(openPage: OpenTestPage()),
      ),
    );
  }
}

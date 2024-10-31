import 'package:cashorbit/core/utils/colors.dart';
import 'package:cashorbit/routes/fab.dart';
import 'package:cashorbit/ui/screens/add_transaction_page.dart';
import 'package:cashorbit/ui/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
        fontFamily: 'Avenir',
        primaryColor: Colors.white,
        primaryColorDark: Colors.grey[200],
        primaryColorLight: Colors.grey[100],
        brightness: Brightness.light,
        canvasColor: Colors.grey[100],
        appBarTheme:
            const AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle.dark),
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: Theme.of(context).colorScheme.accentColor),
      ),
      darkTheme: ThemeData(
        fontFamily: 'Avenir',
        primaryColor: Colors.black,
        primaryColorDark: Colors.grey[800],
        primaryColorLight: Colors.grey[850],
        brightness: Brightness.dark,
        indicatorColor: Colors.white,
        canvasColor: Colors.black,
        appBarTheme:
            const AppBarTheme(systemOverlayStyle: SystemUiOverlayStyle.light),
        colorScheme: ColorScheme.fromSwatch()
            .copyWith(secondary: Theme.of(context).colorScheme.accentColor),
      ),
      themeMode: ThemeMode.system,
      home: const Scaffold(
        body: MyHomePage(
          title: "test",
        ),
        floatingActionButton: Fab(
            openPage: AddTransactionPage(
          title: "",
        )),
      ),
    );
  }
}

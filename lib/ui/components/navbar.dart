import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key, required this.title});

  final String title;

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  //Can access title by using widget.title
  //Call this widget in main like so: NavBar(title:"test")
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

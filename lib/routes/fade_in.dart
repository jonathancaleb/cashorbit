import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// A widget that fades in its child over a specified duration.
class FadeIn extends StatefulWidget {
  /// Creates a [FadeIn] widget.
  ///
  /// The [child] parameter is required and represents the widget to be faded in.
  const FadeIn({super.key, required this.child});

  /// The child widget that will be faded in.
  final Widget child;

  @override
  FadeInState createState() => FadeInState();
}

/// The state for the [FadeIn] widget.
class FadeInState extends State<FadeIn> {
  /// The opacity of the widget, initialized to 0 (fully transparent).
  double widgetOpacity = 0;

  @override
  void initState() {
    super.initState();
    // Delay the fade-in effect by 10 milliseconds.
    Future.delayed(const Duration(milliseconds: 10), () {
      setState(() {
        // Change the opacity to 1 (fully opaque).
        widgetOpacity = 1;
      });
      // Print a debug message if in debug mode.
      if (kDebugMode) {
        print("Changed");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Return an AnimatedOpacity widget that animates the opacity of the child.
    return AnimatedOpacity(
        opacity: widgetOpacity,
        duration: const Duration(seconds: 1),
        child: widget.child);
  }
}

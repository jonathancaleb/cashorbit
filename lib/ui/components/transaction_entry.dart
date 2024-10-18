import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

/// A stateless widget that represents a transaction entry with an animated open/close container.
///
/// This widget displays a [ListTile] that, when tapped, opens a specified [openPage]
/// with a fade transition. It also prints a message to the console when the container is closed.
class TransactionEntry extends StatelessWidget {
  const TransactionEntry({super.key, required this.openPage});

  final Widget openPage; // The widget to display when the container is opened.
  final double fabSize =
      50; // The size of the floating action button (not currently used).

  @override
  Widget build(BuildContext context) {
    return OpenContainer<bool>(
      transitionType: ContainerTransitionType.fade,
      openBuilder: (BuildContext context, VoidCallback _) {
        return openPage; // The widget displayed when the container is opened.
      },
      onClosed: () {
        if (kDebugMode) {
          print(
              "👋 Container closed! Thank you for using the Transaction Entry widget.");
        } // Updated print statement with emoji.
      }(),
      tappable: false,
      closedShape: const RoundedRectangleBorder(),
      closedElevation: 0.0,
      closedBuilder: (BuildContext _, VoidCallback openContainer) {
        return ListTile(
          leading: const FlutterLogo(),
          onTap:
              openContainer, // Opens the container when the ListTile is tapped.
          title: const Text('Test'),
          subtitle: const Text('Test'),
        );
      },
    );
  }
}

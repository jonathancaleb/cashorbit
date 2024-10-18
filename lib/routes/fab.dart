import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

/// A Floating Action Button (FAB) that opens a specified page with a smooth transition.
class Fab extends StatelessWidget {
  /// Creates a [Fab] widget.
  ///
  /// The [openPage] parameter is required and specifies the widget to be displayed
  /// when the FAB is tapped.
  const Fab({super.key, required this.openPage});

  /// The widget that will be displayed when the FAB is tapped.
  final Widget openPage;

  /// The size of the FAB.
  final double fabSize = 50; // Changed to final

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      /// Specifies the type of transition when opening the container.
      transitionType: ContainerTransitionType.fade,

      /// Builder function that returns the [openPage] widget when the FAB is tapped.
      openBuilder: (BuildContext context, VoidCallback _) {
        return openPage;
      },

      /// Elevation of the closed FAB.
      closedElevation: 6.0,

      /// Shape of the closed FAB.
      closedShape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(fabSize / 2), // Circular shape based on fabSize
        ),
      ),

      /// Background color of the closed FAB.
      closedColor: Theme.of(context).colorScheme.secondary,

      /// Builder function that defines the appearance of the FAB when it is closed.
      closedBuilder: (BuildContext context, VoidCallback openContainer) {
        return InkWell(
          /// Callback that is triggered when the FAB is tapped.
          onTap: () {
            openContainer(); // Opens the specified page
          },
          child: SizedBox(
            height: fabSize, // Height of the FAB
            width: fabSize, // Width of the FAB
            child: Center(
              child: Icon(
                Icons.add, // Icon displayed on the FAB
                color: Theme.of(context).colorScheme.onSecondary, // Icon color
              ),
            ),
          ),
        );
      },
    );
  }
}

/// A simple test page that can be opened by the FAB.
class OpenTestPage extends StatelessWidget {
  /// Creates an instance of [OpenTestPage].
  const OpenTestPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test page'), // Title of the app bar
      ),
      body: Container(), // Empty body for the test page
    );
  }
}

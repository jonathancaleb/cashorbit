import 'package:cashorbit/core/utils/colors.dart';
import 'package:cashorbit/ui/components/text_widgets.dart';
import 'package:flutter/material.dart';

class Button extends StatefulWidget {
  Button(
      {Key? key,
      required this.label,
      required this.width,
      required this.height,
      this.fontSize,
      this.fractionScaleHeight,
      this.fractionScaleWidth,
      required this.onTap})
      : super(key: key);
  final String label;
  final double width;
  final double height;
  final double? fontSize;
  final double? fractionScaleHeight;
  final double? fractionScaleWidth;
  final VoidCallback onTap;

  @override
  _ButtonState createState() => _ButtonState();
}

class _ButtonState extends State<Button> with TickerProviderStateMixin {
  bool isTapped = false;

  void _shrink() {
    setState(() {
      isTapped = true;
    });
    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        isTapped = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      child: Scaffold(
        body: Center(
          child: Material(
            borderRadius: const BorderRadius.all(Radius.circular(10)),
            color: Theme.of(context).colorScheme.accentColor.withOpacity(0.8),
            child: InkWell(
              onHighlightChanged: (value) {
                setState(() {
                  isTapped = value;
                });
              },
              onTap: () {
                _shrink();
                widget.onTap();
              },
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeOutCubic,
                height: isTapped
                    ? widget.height * (widget.fractionScaleHeight ?? 0.93)
                    : widget.height,
                width: isTapped
                    ? widget.width * (widget.fractionScaleWidth ?? 0.93)
                    : widget.width,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                    Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Theme.of(context)
                          .colorScheme
                          .accentColor
                          .withOpacity(0.5),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Center(
                  child: TextFont(
                    text: widget.label,
                    fontSize: widget.fontSize ?? 16,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

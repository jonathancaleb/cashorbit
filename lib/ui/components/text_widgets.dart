import 'package:flutter/material.dart';
import '../../core/utils/colors.dart';

class TextFont extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color? textColor;
  final TextAlign textAlign;
  final int? maxLines;

  const TextFont(
      {super.key,
      required this.text,
      this.fontSize = 20,
      this.fontWeight = FontWeight.normal,
      this.textAlign = TextAlign.left,
      this.textColor,
      this.maxLines});

  @override
  Widget build(BuildContext context) {
    Color? finalTextColor;
    if (textColor == null) {
      finalTextColor = Theme.of(context).colorScheme.black;
    } else {
      finalTextColor = textColor;
    }
    return Text(
      text,
      maxLines: maxLines,
      textAlign: textAlign,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          fontWeight: fontWeight,
          fontSize: fontSize,
          fontFamily: 'Avenir',
          color: finalTextColor,
          decoration: TextDecoration.underline,
          decorationStyle: TextDecorationStyle.double,
          decorationColor: const Color(0x00FFFFFF)),
    );
  }
}

class TextHeader extends StatelessWidget {
  const TextHeader({required this.text, super.key});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Theme.of(context).canvasColor,
      child: Padding(
        padding:
            const EdgeInsets.only(left: 18.0, right: 18, top: 10, bottom: 5),
        child: TextFont(
          text: text,
          fontSize: 33,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

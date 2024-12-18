import 'package:flutter/material.dart';

//import '../colors.dart';
//Theme.of(context).colorScheme.lightDarkAccent

extension ColorsDefined on ColorScheme {
  Color get white =>
      brightness == Brightness.light ? Colors.white : Colors.black;
  Color get black =>
      brightness == Brightness.light ? Colors.black : Colors.white;
  Color get lightDarkAccent => brightness == Brightness.light
      ? const Color(0xFFFAFAFA)
      : const Color(0xFF242424);
  Color get lightDarkAccentHeavy => brightness == Brightness.light
      ? const Color(0xFFDBDBDB)
      : const Color(0xFF444444);
  Color get shadowColor => brightness == Brightness.light
      ? const Color(0x655A5A5A)
      : const Color(0x69BDBDBD);
  Color get shadowColorLight => brightness == Brightness.light
      ? const Color(0x2D5A5A5A)
      : const Color(0x4BBDBDBD);
  Color get accentColor => brightness == Brightness.light
      ? const Color(0xFF46A872)
      : const Color(0xFF1E7A1B);
  Color get accentColorHeavy => brightness == Brightness.light
      ? const Color(0xFF1C683E)
      : const Color(0xFF7CFF77);
}

Color darken(Color color, [double amount = .1]) {
  assert(amount >= 0 && amount <= 1);

  final hsl = HSLColor.fromColor(color);
  final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

  return hslDark.toColor();
}

Color lighten(Color color, [double amount = .1]) {
  assert(amount >= 0 && amount <= 1);

  final hsl = HSLColor.fromColor(color);
  final hslLight = hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

  return hslLight.toColor();
}

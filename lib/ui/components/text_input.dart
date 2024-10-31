import 'package:cashorbit/core/utils/colors.dart';
import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String labelText;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final bool obscureText;

  const TextInput({
    super.key,
    required this.labelText,
    this.onChanged,
    this.onSubmitted,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 18.0, right: 18),
      child: TextField(
        style: const TextStyle(
          fontSize: 18,
        ),
        cursorColor: Theme.of(context).colorScheme.accentColorHeavy,
        decoration: new InputDecoration(
          contentPadding:
              const EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 10),
          hintText: labelText,
          filled: true,
          fillColor:
              Theme.of(context).colorScheme.lightDarkAccent.withOpacity(0.2),
          isDense: true,
          icon: Icon(
            Icons.note_alt_rounded,
            size: 40,
            color: Theme.of(context).colorScheme.accentColorHeavy,
          ),
          enabledBorder: UnderlineInputBorder(
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(8.0)),
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme.lightDarkAccent),
          ),
          focusedBorder: UnderlineInputBorder(
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(5.0)),
            borderSide: BorderSide(
                color: Theme.of(context).colorScheme.accentColorHeavy),
          ),
        ),
        obscureText: obscureText,
        onChanged: (text) {
          if (onChanged != null) {
            onChanged!(text);
          }
        },
        onSubmitted: (text) {
          if (onSubmitted != null) {
            onSubmitted!(text);
          }
        },
      ),
    );
  }
}

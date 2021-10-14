import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Palette {
  static ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.blue,
  );
  static ThemeData darkTheme = ThemeData(
    colorScheme: ColorScheme.dark(),
  );
  static const InputDecoration largetextfield = InputDecoration(
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide.none,
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide.none,
    ),
  );
  static const TextStyle largetext =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w400);
  static const TextStyle largeboldtext =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);

  static const TextStyle singleOperandButton =
      TextStyle(fontSize: 30, color: Colors.green, fontWeight: FontWeight.w400);
  static const TextStyle removalButton =
      TextStyle(fontSize: 28, color: Colors.red, fontWeight: FontWeight.w400);
  static const TextStyle twoOpereandStyle =
      TextStyle(fontSize: 30, color: Colors.blue, fontWeight: FontWeight.w400);
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Palette {
  static ThemeData lightTheme = ThemeData(
    appBarTheme: const AppBarTheme(
      foregroundColor: Colors.white,
      backgroundColor: Colors.deepOrangeAccent,
      centerTitle: true,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(primary: Colors.deepOrangeAccent)),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(primary: Colors.deepOrangeAccent)),
  );
  static ThemeData darkTheme = ThemeData(
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(primary: Colors.deepOrange)),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(primary: Colors.deepOrange)),
    appBarTheme: const AppBarTheme(
      foregroundColor: Colors.white,
      backgroundColor: Colors.deepOrange,
      centerTitle: true,
    ),
    colorScheme: const ColorScheme.dark(),
  );

  static const TextStyle singleOperandButton = TextStyle(
      fontSize: 30, color: Colors.greenAccent, fontWeight: FontWeight.w400);
  static const TextStyle removalButton = TextStyle(
      fontSize: 28, color: Colors.redAccent, fontWeight: FontWeight.w400);
  static const TextStyle twoOpereandStyle = TextStyle(
      fontSize: 30, color: Colors.blueAccent, fontWeight: FontWeight.w400);
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class Palette {
  static ThemeData lightTheme = ThemeData(
    textTheme: GoogleFonts.poppinsTextTheme(),
    appBarTheme: AppBarTheme(
      foregroundColor: Colors.white,
      backgroundColor: Colors.indigo[300],
      centerTitle: true,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(primary: Colors.indigo[300])),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(primary: Colors.indigo[300])),
  );
  static ThemeData darkTheme = ThemeData(
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(primary: Colors.deepOrange)),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(primary: Colors.deepOrange)),
    colorScheme: const ColorScheme.dark(),
  );

  static const TextStyle singleOperandButton = TextStyle(
      fontSize: 30, color: Colors.greenAccent, fontWeight: FontWeight.w400);
  static const TextStyle removalButton = TextStyle(
      fontSize: 28, color: Colors.redAccent, fontWeight: FontWeight.w400);
  static const TextStyle twoOpereandStyle = TextStyle(
      fontSize: 30, color: Colors.blueAccent, fontWeight: FontWeight.w400);
}

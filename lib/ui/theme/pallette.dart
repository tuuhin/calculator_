import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class Palette {
  static ThemeData lightTheme = ThemeData(
    textTheme: GoogleFonts.poppinsTextTheme(),
    appBarTheme: AppBarTheme(
      foregroundColor: Colors.white,
      backgroundColor: Colors.indigo[400],
      centerTitle: true,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(primary: Colors.indigo[600])),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(primary: Colors.indigoAccent[400])),
  );
  static ThemeData darkTheme = ThemeData(
    fontFamily: GoogleFonts.poppins().fontFamily,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.deepPurple[700],
      centerTitle: true,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(primary: Colors.deepPurple[700])),
    textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(primary: Colors.deepPurpleAccent[700])),
    colorScheme: const ColorScheme.dark(),
  );

  static TextStyle singleOperandButton = TextStyle(
      color: Colors.tealAccent[400],
      fontSize: 28,
      fontFamily: GoogleFonts.ubuntu().fontFamily);

  static TextStyle removalButton = TextStyle(
      fontSize: 30,
      color: Colors.pinkAccent[200],
      fontWeight: FontWeight.w500,
      fontFamily: GoogleFonts.ubuntuCondensed().fontFamily);

  static TextStyle twoOpereandStyle = TextStyle(
      fontSize: 40,
      color: Colors.lightBlueAccent[200],
      fontWeight: FontWeight.w500,
      fontFamily: GoogleFonts.ubuntuCondensed().fontFamily);

  static const TextStyle equalsToStyle =
      TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.w400);

  static TextStyle numberStyle = TextStyle(
      fontSize: 35,
      fontWeight: FontWeight.w500,
      fontFamily: GoogleFonts.ubuntu().fontFamily);
}

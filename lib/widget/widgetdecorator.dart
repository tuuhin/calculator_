import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Palette {
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
  static final ButtonStyle convertboarddifferent = ElevatedButton.styleFrom(
    elevation: 0,
    fixedSize: const Size(50, 80),
  );
  static ButtonStyle lightTextButton = TextButton.styleFrom(
      elevation: 0,
      textStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold));
  static ButtonStyle darkTextButton = TextButton.styleFrom(
      elevation: 0,
      textStyle: const TextStyle(
          fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white));
}

import 'package:flutter/material.dart';

const Color blue = Color(0xFF4E5AE8);
const Color yellow = Color(0xFFFFB746);
const Color pink = Color(0xFFFF4667);
const Color white = Color(0xFFFFFFFF);
const Color darkGrey = Color(0xFF121212);
const Color darkHeader = Color(0xFF424242);

class Themes {
  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
    appBarTheme: const AppBarTheme(backgroundColor: white, elevation: 0),
    canvasColor: white,
  );
  static final ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    appBarTheme: const AppBarTheme(backgroundColor: darkGrey, elevation: 0),
    canvasColor: darkGrey,
  );
}

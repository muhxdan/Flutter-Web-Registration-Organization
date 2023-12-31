import 'package:flutter/material.dart';

class Themes {
  static final light = ThemeData(
    brightness: Brightness.light,
    primaryColor: const Color(0xff620000),
    scaffoldBackgroundColor: Colors.white,
    fontFamily: 'Sans',
    textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
      titleLarge: TextStyle(fontSize: 30.0, fontStyle: FontStyle.italic),
    ),
  );
}

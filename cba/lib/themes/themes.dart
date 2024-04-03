import 'package:flutter/material.dart';

final lightTheme = ThemeData.light().copyWith(
  appBarTheme: const AppBarTheme(
    backgroundColor: Color.fromARGB(255, 0, 128, 254),
    elevation: 4,
  ),
  colorScheme: const ColorScheme.light(
    primary: Color.fromARGB(255, 0, 128, 254),
    secondary: Color(0xFF009688),
    background: Color(0xFFE0F2F1),
  ),
  scaffoldBackgroundColor: Colors.white,
);

final darkTheme = ThemeData.dark().copyWith(
  appBarTheme: const AppBarTheme(
    backgroundColor: Color.fromARGB(255, 0, 128, 254),
    elevation: 4,
  ),
  colorScheme: const ColorScheme.dark(
    primary: Color.fromARGB(255, 0, 128, 254),
    secondary: Color(0xFF0097A7),
    background: Color(0xFFE0F2F1),
  ),
  scaffoldBackgroundColor: Colors.white,
);

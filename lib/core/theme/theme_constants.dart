import 'package:flutter/material.dart';

class ThemeConstants {
  static ThemeConstants? _instace;
  static ThemeConstants get instance {
    _instace ??= ThemeConstants._init();
    return _instace!;
  }

  ThemeConstants._init();
  ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.deepPurple,
    primaryColorDark: Colors.deepPurple[900],
    primaryColorLight: Colors.deepPurple[300],
    accentColor: Colors.amber,
    fontFamily: 'Hind',
    backgroundColor: Colors.grey[50],
    scaffoldBackgroundColor: Colors.grey[50],
    canvasColor: Colors.white,
    appBarTheme: AppBarTheme(
      brightness: Brightness.dark,
    ),
    buttonTheme: ButtonThemeData(
      textTheme: ButtonTextTheme.primary,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(primary: Color(0xFF138C32)),
    ),
    textTheme: TextTheme(
      headline4: TextStyle(color: Color(0xff272833), fontFamily: 'Poppins', fontWeight: FontWeight.w800),
      headline6: TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w700),
    ),
  );
}

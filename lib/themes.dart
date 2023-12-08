import 'package:flutter/material.dart';

class Themes {
  static final ColorScheme _colorScheme = ColorScheme.fromSeed(
        seedColor: const Color(0xff153faa),
        secondary: Colors.black,
        onPrimary: Colors.white,
        onSecondary: Colors.white);
  static ThemeData main = ThemeData(
    fontFamily: 'Inter',
    useMaterial3: false,
    colorScheme: _colorScheme,
    highlightColor: Colors.transparent,
    splashFactory: NoSplash.splashFactory,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: const Color(0xff353535)),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: MaterialStateColor.resolveWith(
        (states) {
          if (states.contains(MaterialState.selected)) {
            return const Color(
                0xff153faa); // the color when checkbox is selected;
          }
          return Colors.white; //the color when checkbox is unselected;
        },
      ),
    ),
  );
}

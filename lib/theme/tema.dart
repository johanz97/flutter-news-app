import 'package:flutter/material.dart';

final miTema = ThemeData.dark().copyWith(
    bottomNavigationBarTheme:
        const BottomNavigationBarThemeData(selectedItemColor: Colors.red),
    colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.red),
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(color: Colors.red));

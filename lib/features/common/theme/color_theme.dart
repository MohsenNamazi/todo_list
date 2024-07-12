import 'package:flutter/material.dart';
import 'package:todo_list/features/common/theme/colors.dart';

final _defaultTextColorLight = ColorPalettes.neutralLight[800];
final _defaultTextColorDark = ColorPalettes.neutralDark[800];

final lightTheme = ThemeData(
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: ColorPalettes.neutralLight[50],
    foregroundColor: ColorPalettes.neutralLight[900],
    shape: CircleBorder(
      side: BorderSide(
        color: ColorPalettes.neutral[300]!,
      ),
    ),
    elevation: 0,
  ),
  useMaterial3: false,
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: Colors.transparent,
  ),
  brightness: Brightness.light,
  scaffoldBackgroundColor: ColorPalettes.neutralLight[50],
  primaryColor: ColorPalettes.pinkLight[300],
  appBarTheme: AppBarTheme(
    backgroundColor: ColorPalettes.neutralLight[50],
    foregroundColor: ColorPalettes.neutralLight[900],
    elevation: 0,
  ),
  textTheme: const TextTheme().apply(
    bodyColor: _defaultTextColorLight,
    displayColor: _defaultTextColorLight,
  ),
  colorScheme: const ColorScheme.light(),
  listTileTheme:
      const ListTileThemeData(selectedColor: ColorPalettes.pinkLight),
);

final darkTheme = ThemeData(
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: ColorPalettes.neutralDark[50],
    foregroundColor: ColorPalettes.neutralDark[900],
    shape: CircleBorder(
      side: BorderSide(
        color: ColorPalettes.neutral[300]!,
      ),
    ),
    elevation: 0,
  ),
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: Colors.transparent,
  ),
  brightness: Brightness.dark,
  scaffoldBackgroundColor: ColorPalettes.neutralDark[50],
  primaryColor: ColorPalettes.pinkDark[300],
  appBarTheme: AppBarTheme(
    backgroundColor: ColorPalettes.neutralDark[50],
    foregroundColor: ColorPalettes.neutralDark[900],
    elevation: 0,
  ),
  textTheme: const TextTheme().apply(
    bodyColor: _defaultTextColorDark,
    displayColor: _defaultTextColorDark,
  ),
  colorScheme: ColorScheme.dark(surface: ColorPalettes.neutralDark[50]!),
  listTileTheme: const ListTileThemeData(selectedColor: ColorPalettes.pinkDark),
);

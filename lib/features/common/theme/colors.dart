import 'dart:ui';

import 'package:flutter/material.dart';

abstract class ColorPalette extends ColorSwatch<int> {
  const ColorPalette(super.primary, super.swatch);
}

class ColorPaletteLight extends ColorPalette {
  const ColorPaletteLight(super.primary, super.swatch);
}

class ColorPaletteDark extends ColorPalette {
  const ColorPaletteDark(super.primary, super.swatch);
}

abstract final class ColorPalettes {
  static ThemeMode theme = ThemeMode.system;

  /// [PlatformDispatcher] which holds [Brightness] without the need for
  /// [BuildContext]
  static final _dispatcher = WidgetsBinding.instance.platformDispatcher;

  static Brightness get _brightness => theme == ThemeMode.system
      ? _dispatcher.platformBrightness
      : theme == ThemeMode.light
          ? Brightness.light
          : Brightness.dark;

  /// Pink Color

  /// Pink Light Mode
  static const ColorPaletteLight pinkLight = ColorPaletteLight(
    _pinkLightPrimaryValue,
    <int, Color>{
      50: Color(0xFFFEF1F6),
      100: Color(0xFFFDD5E3),
      200: Color(0xFFFBB7CF),
      300: Color(0xFFF999BB),
      400: Color(0xFFF779A5),
      500: Color(_pinkLightPrimaryValue),
      600: Color(0xFFCA5086),
      700: Color(0xFFB43C76),
      800: Color(0xFF972762),
      900: Color(0xFF730F49),
    },
  );
  static const int _pinkLightPrimaryValue = 0xFFE16595;

  /// Pink Dark Mode
  static const ColorPaletteDark pinkDark = ColorPaletteDark(
    _pinkDarkPrimaryValue,
    <int, Color>{
      50: Color(0xFF370423),
      100: Color(0xFF660840),
      200: Color(0xFF881457),
      300: Color(0xFFA12B68),
      400: Color(0xFFB94179),
      500: Color(_pinkDarkPrimaryValue),
      600: Color(0xFFEC6F9E),
      700: Color(0xFFF992B6),
      800: Color(0xFFFBBCD2),
      900: Color(0xFFFEE5ED),
    },
  );
  static const int _pinkDarkPrimaryValue = 0xFFD1578B;

  /// Returns either [pinkLight] or [pinkDark]
  /// based on the [Brightness] returned by
  /// [platformBrightness] in [PlatformDispatcher]
  static ColorPalette get pink =>
      _brightness == Brightness.light ? pinkLight : pinkDark;

  /// Returns either [pinkLight] or [pinkDark]
  /// based on the [Brightness] passed as a parameter or returned by
  /// [platformBrightness] in [PlatformDispatcher]
  static ColorPalette pinkByBrightness(Brightness? brightness) =>
      (brightness ?? _brightness) == Brightness.light ? pinkLight : pinkDark;

  /// Neutral Color

  /// Neutral Light Mode
  static const ColorPaletteLight neutralLight = ColorPaletteLight(
    _neutralLightPrimaryValue,
    <int, Color>{
      50: Color(0xFFFFFFFF),
      100: Color(0xFFF4F4F4),
      200: Color(0xFFE3E3E3),
      300: Color(0xFFC8C8C8),
      400: Color(0xFF969696),
      500: Color(_neutralLightPrimaryValue),
      600: Color(0xFF505050),
      700: Color(0xFF3A3A3A),
      800: Color(0xFF212121),
      900: Color(0xFF000000),
    },
  );
  static const int _neutralLightPrimaryValue = 0xFF666666;

  /// Neutral Dark Mode
  static const ColorPaletteDark neutralDark = ColorPaletteDark(
    _neutralDarkPrimaryValue,
    <int, Color>{
      50: Color(0xFF000000),
      100: Color(0xFF212121),
      200: Color(0xFF3A3A3A),
      300: Color(0xFF505050),
      400: Color(0xFF666666),
      500: Color(_neutralDarkPrimaryValue),
      600: Color(0xFFC8C8C8),
      700: Color(0xFFE3E3E3),
      800: Color(0xFFF4F4F4),
      900: Color(0xFFFFFFFF),
    },
  );
  static const int _neutralDarkPrimaryValue = 0xFF969696;

  /// Returns either [neutralLight] or [neutralDark]
  /// based on the [Brightness] returned by
  /// [platformBrightness] in [PlatformDispatcher]
  static ColorPalette get neutral =>
      _brightness == Brightness.light ? neutralLight : neutralDark;

  /// Returns either [neutralLight] or [neutralDark]
  /// based on the [Brightness] passed as a parameter or returned by
  /// [platformBrightness] in [PlatformDispatcher]
  static ColorPalette neutralByBrightness(Brightness? brightness) =>
      (brightness ?? _brightness) == Brightness.light
          ? neutralLight
          : neutralDark;
}

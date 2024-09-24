import "package:flutter/material.dart" show Brightness, Color, ColorScheme, Colors;

import "app_colors.dart";

const ColorScheme lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: AppColors.appMainColorLight,
  onPrimary: AppColors.appBottomNavColorLight,
  secondary: AppColors.black,
  onPrimaryContainer: Colors.deepOrange,
  onSecondary: AppColors.appMainLight,

  primaryContainer: Color(0xff141311),

  secondaryContainer: Color(0xffffffff),
  onSecondaryContainer: Color(0xff141414),
  tertiary: Color(0xff141311),
  onTertiary: Color(0xff000000),
  tertiaryContainer: Color(0xffEDEDED),
  onTertiaryContainer: Color(0xff141413),
  error: Color(0xffb00020),
  onError: Color(0xffffffff),
  errorContainer: Color(0xfffcd8df),
  onErrorContainer: Color(0xff141213),
  surface: Color(0xffffffff),
  onSurface: Color(0xff141311),
  surfaceContainerHighest: Color(0xffeee8e3),
  onSurfaceVariant: Color(0xff121211),
  outline: Color(0xff837676),
  outlineVariant: Color(0xffccc6c6),
  shadow: Color(0xff000000),
  scrim: Color(0xff000000),
  inverseSurface: Color(0xff171411),
  onInverseSurface: Color(0xfff5f5f5),
  inversePrimary: Color(0xfffff8c0),
  surfaceTint: Color(0xff3F3F3F),
);

const ColorScheme darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: AppColors.appMainColor,
  onPrimary: AppColors.appBottomNavColor,
  secondary: AppColors.white,
  onPrimaryContainer: Colors.deepOrange,
  onSecondary: AppColors.appMainDark,

  surface: Colors.black,     // light.primary == black.surface


  primaryContainer: AppColors.yellow,
  secondaryContainer:  Colors.blue,
  onSecondaryContainer: Colors.blue,
  tertiary: Colors.blue,
  onTertiary: Colors.blue,
  tertiaryContainer:  Colors.blue,
  onTertiaryContainer: Colors.blue,
  error: Color(0xffb00020),
  onError:  Colors.blue,
  errorContainer: Colors.blue,
  onErrorContainer: Colors.blue,
  onSurface: Color(0xff141311),
  surfaceContainerHighest: Color(0xff141311),
  onSurfaceVariant: Color(0xff121211),
  outline: Color(0xff141311),
  outlineVariant: Color(0xff141311),
  shadow: Color(0xff000000),
  scrim: Color(0xff000000),
  inverseSurface: Color(0xff171411),
  onInverseSurface: Color(0xff141311),
  inversePrimary: Color(0xff141311),
  surfaceTint: Color(0xff3F3F3F),
);

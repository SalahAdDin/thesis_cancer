import 'package:flutter/material.dart';

///
const Color primary = Color(0xff00a478);

// Which is the default value for this?
// It affects the disabled button style.
///
const Color onSurface = primary; // Color(0xffb4e4d7);

///
MaterialColor materialJadeColor = const MaterialColor(
  0xff00a478,
  <int, Color>{
    50: Color(0xffe0f4ee), //10%
    100: Color(0xffb4e4d4), //20%
    200: Color(0xff84d3b9), //30%
    300: Color(0xff52c19e), //40%
    400: Color(0xff2bb38a), //50%
    500: Color(0xff00a478), //60%
    600: Color(0xff00966c), //70%
    700: Color(0xff00865d), //80%
    800: Color(0xff00764f), //90%
    900: Color(0xff005933), //100%
  },
);

///
ColorScheme lightColorScheme =
    ColorScheme.fromSwatch(primarySwatch: materialJadeColor);

///
final ThemeData lightTheme = ThemeData(
  primarySwatch: materialJadeColor,
  brightness: Brightness.light,
  colorScheme: lightColorScheme.copyWith(onSurface: materialJadeColor.shade500),
  appBarTheme: AppBarTheme(
    elevation: 0,
    color: Colors.white70,
    titleTextStyle: TextStyle(
      color: materialJadeColor.shade500,
      fontWeight: FontWeight.bold,
    ),
    iconTheme: IconThemeData(
      color: materialJadeColor.shade500,
    ),
  ),
  textTheme: ThemeData.light().textTheme.copyWith(
        subtitle1: ThemeData.light().textTheme.subtitle1!.copyWith(
              color: Colors.grey,
            ),
      ),
);

///
final ThemeData darkTheme = ThemeData.dark().copyWith(
  primaryColor: primary,
  // accentColor: primary,
  // errorColor: Colors.red[300],
  colorScheme: ThemeData.dark().colorScheme.copyWith(
        primary: materialJadeColor.shade500,
      ),
  appBarTheme: AppBarTheme(
    color: materialJadeColor.shade500,
    titleTextStyle: const TextStyle(
      fontWeight: FontWeight.bold,
    ),
  ),
);

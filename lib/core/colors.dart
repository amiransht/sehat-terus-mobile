import 'package:flutter/material.dart';

class BaseColors {
  static const Color black = Colors.black;
  static const Color white = Colors.white;

  static const int _greenPrimaryValue = 0xFF17A2B8;
  static const MaterialColor green = MaterialColor(
    _greenPrimaryValue,
    <int, Color>{
      500: Color(_greenPrimaryValue),
    },
  );

  static const int _redPrimaryValue = 0xFFb83128;
  static const MaterialColor charcoal = MaterialColor(
    _redPrimaryValue,
    <int, Color>{
      900: Color(_redPrimaryValue),
    },
  );
}
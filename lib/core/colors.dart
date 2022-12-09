import 'package:flutter/material.dart';

class BaseColors {
  static const Color black = Colors.black;
  static const Color white = Colors.white;

  static const int _greenPrimaryValue = 0xFF17A2B8;

  static const MaterialColor green = MaterialColor(
    _greenPrimaryValue,
    <int, Color>{
      900: Color(_greenPrimaryValue),
      400: Color.fromARGB(255, 182, 224, 230),
    },
  );


  static const int _redPrimaryValue = 0xFFb83128;
  static const MaterialColor red = MaterialColor(
    _redPrimaryValue,
    <int, Color>{
      900: Color(_redPrimaryValue),
    },
  );

  static const int _greyPrimaryValue = 0xFFe9ecef;
  static const MaterialColor grey = MaterialColor(
    _greyPrimaryValue,
    <int, Color>{
      900: Color(_greyPrimaryValue),
    },
  );

  static LinearGradient getLinearGradient(MaterialColor color) {
    return LinearGradient(
      begin: Alignment.bottomLeft,
      end: Alignment.topRight,
      colors: [
        color[600]!,
        color[600]!,
        color[600]!,
      ],
      stops: const [
        0.4,
        0.8,
        0.9,
      ],
    );
  }
}

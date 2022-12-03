import 'package:flutter/material.dart';
import 'package:sehat_terus/core/colors.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
      title: Image.asset(
        'assets/logo.png',
        fit: BoxFit.contain,
        height: 56,
      ),
      centerTitle: true,
      elevation: 2.2,
      backgroundColor: BaseColors.white,
      iconTheme: const IconThemeData(color: BaseColors.black),
      shadowColor: BaseColors.black);
}

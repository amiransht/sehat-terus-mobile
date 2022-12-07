import 'package:flutter/material.dart';
import 'package:sehat_terus/core/colors.dart';

AppBar buildAppBar(BuildContext context) {
  if (ModalRoute.of(context)!.settings.name == "/home") {
    return AppBar(
        leadingWidth: 250,
        leading: Image.asset(
          'assets/logo.png',
          fit: BoxFit.contain,
          height: 150,
        ),
        actions: const[
          Icon(
            Icons.message_outlined,
            size: 20,
          ),
          SizedBox(
            width: 15,
          )
        ],
        centerTitle: true,
        elevation: 2.2,
        backgroundColor: BaseColors.white,
        iconTheme: const IconThemeData(color: BaseColors.black),
        shadowColor: BaseColors.black);
  } else{
    return AppBar(
        leading: IconButton(
          splashRadius: 20.0,
          splashColor: BaseColors.green.withOpacity(0.3),
          highlightColor: BaseColors.green.withOpacity(0.3),
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
        ), 
        elevation: 2.2,
        backgroundColor: BaseColors.white,
        iconTheme: const IconThemeData(color: BaseColors.black),
        shadowColor: BaseColors.black);
  }
}

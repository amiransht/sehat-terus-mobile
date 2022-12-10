import 'package:flutter/material.dart';
import 'package:sehat_terus/core/colors.dart';

AppBar buildAppBar(BuildContext context, judul) {
  if (ModalRoute.of(context)!.settings.name == "/blog" ) {
    return AppBar(
        leading: Padding(padding: EdgeInsets.all(0)),
        title: Text(
              judul,
              style: TextStyle(color: BaseColors.black, fontSize: 18),
            ),
          centerTitle: true,
          elevation: 2.2,
          backgroundColor: Colors.transparent,
        );
  } else {
    return AppBar(
        leading: IconButton(
          iconSize: 20,
            padding: EdgeInsets.only(left:20.0),
            splashRadius: 20.0,
            splashColor: BaseColors.green.withOpacity(0.3),
            highlightColor: BaseColors.green.withOpacity(0.3),
            icon: Icon(Icons.arrow_back_ios, color: BaseColors.green),
            onPressed: () => Navigator.pushReplacementNamed(context, '/main'),
          ),
        titleSpacing: 5.0,
        title: Text(
              judul,
              style: TextStyle(color: BaseColors.black, fontSize: 18),
            ),
        
        elevation: 2.2,
        backgroundColor: BaseColors.white,
        iconTheme: const IconThemeData(color: BaseColors.black),
        shadowColor: BaseColors.black);
  }
}

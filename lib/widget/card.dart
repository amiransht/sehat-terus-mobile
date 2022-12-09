import 'package:flutter/material.dart';
import 'package:sehat_terus/core/colors.dart';

class CardContainer extends StatelessWidget {
  final String image;
  final String title;
  CardContainer({
    Key? key,
    required this.image,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        boxShadow: [
           BoxShadow(
              offset: Offset(0, 3),
              blurRadius: 6,
              color: kShadowColor,
            ),
        ],
      ),
      child: Column(
        children: <Widget>[
          Image.asset(image, height: 90),
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

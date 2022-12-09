import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
import 'package:sehat_terus/core/colors.dart';

class Counter extends StatelessWidget {
  final double number;
  final Color color;
  final String title;
  const Counter({
    Key? key,
    required this.number,
    required this.color,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(6),
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color.withOpacity(.26),
          ),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(
                color: color,
                width: 2,
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Countup(
          begin: 0,
          end: number,
          separator: '.',
          duration: Duration(milliseconds: 800),
          style: TextStyle(
            fontSize: 25,
            color: color,
            fontWeight: FontWeight.w600
          ),
        ),
        SizedBox(height: 5),
        Text(title, style: kSubTextStyle),
      ],
    );
  }
}

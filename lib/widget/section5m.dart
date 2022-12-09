import 'package:flutter/material.dart';
import 'package:sehat_terus/core/colors.dart';


class Section5mContainer extends StatelessWidget {
  final Color color;
  final Image image;
  final double space;
  final String title;
  Section5mContainer({
    Key? key,
    required this.color,
    required this.image,
    required this.space,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: BaseColors.white.withOpacity(0.8),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            blurRadius: 30,
            color: kShadowColor,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Align(alignment: Alignment.center, child: image),
          SizedBox(
            height: space,
          ),
          Text(
            title,
            maxLines: 2,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

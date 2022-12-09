// import 'package:covid/constant.dart';
// import 'package:covid/info_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sehat_terus/core/colors.dart';

class MyHeader extends StatefulWidget {
  final String image;
  final String logo = "assets/logo.png";
  final String textTop;
  final String textBottom;
  final double offset;
  final bool isHome;
  const MyHeader({
    Key? key,
    required this.image,
    required this.textTop,
    required this.textBottom,
    required this.offset,
    required this.isHome,
  }) : super(key: key);

  @override
  _MyHeaderState createState() => _MyHeaderState();
}

class _MyHeaderState extends State<MyHeader> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        padding: const EdgeInsets.only(left: 15, top: 25, right: 20),
        height: 290,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 152, 238, 255),
              BaseColors.green,
            ],
          ),
          image: DecorationImage(
            image: AssetImage("assets/virus.png"),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            // widget.isHome
            // ? 
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, '/faq');
              },
              child: widget.isHome
                ? Icon(Icons.question_answer_outlined, 
                  color: BaseColors.white,
                  size: 30)
                : Icon(Icons.info_outline, 
                  color: BaseColors.white,
                  size: 30)
            ),
            Expanded(
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: (widget.offset < 0) ? 0 : widget.offset,
                    child: SvgPicture.asset(
                      widget.image,
                      width: 230,
                      fit: BoxFit.fill,
                      alignment: Alignment.topCenter,
                    ),
                  ),

                  Positioned(
                    top: widget.isHome? 30 - widget.offset / 2
                                      : 40 - widget.offset / 2,
                    left: widget.isHome? 130 : 180,
                    child: widget.isHome
                        ? Image.asset(widget.logo,
                          width: 250, fit: BoxFit.fitWidth,)
                        : Text(
                            "${widget.textTop} \n${widget.textBottom}",
                            style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.bold,
                                color: BaseColors.white),
                          ),
                  ),
                  Container(), // I dont know why it can't work without container
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

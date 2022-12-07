import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sehat_terus/core/colors.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  static const routeName = '/';

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final pgController = PageController();
  int _selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildBody(context),
    );
  }

  Stack buildBody(BuildContext context) {
    return Stack(
      children: [
        bgContainer(context),
        ClipPath(
          clipper: OnboardingClipper(),
          child: Container(
            color: Colors.white,
            height: MediaQuery.of(context).size.height * 0.9,
            child: Stack(
              children: [
                PageView(
                  controller: pgController,
                  onPageChanged: (val) {
                    _selectedPage = val;
                    setState(() {});
                  },
                  children: const [
                    _BoardingWidget(),
                    _BoardingWidget(),
                    _BoardingWidget(),
                  ],
                ),
                Positioned(
                    bottom: 70,
                    left: MediaQuery.of(context).size.width * 0.38,
                    child: InkWell(
                      onTap: () {
                        if (_selectedPage < 2) {
                          _selectedPage++;
                          pgController.animateToPage(
                            _selectedPage,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInOut,
                          );
                          setState(() {});
                        } else {
                          Navigator.pushReplacementNamed(context, '/main');
                        }
                      },
                      child: Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey.withOpacity(0.4),
                                blurRadius: 5,
                                offset: const Offset(2, 2))
                          ],
                          color: Color.fromARGB(255, 225, 127, 120),
                        ),
                        child: const Icon(
                          Icons.arrow_right_alt_rounded,
                          color: Colors.black,
                          size: 32,
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ],
    );
  }

  Container bgContainer(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: BaseColors.green.withOpacity(0.7),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    if (_selectedPage != 0) {
                      _selectedPage--;
                      pgController.animateToPage(
                        _selectedPage,
                        duration: const Duration(milliseconds: 1000),
                        curve: Curves.easeInOut,
                      );
                      setState(() {});
                    }
                  },
                  child: Text(
                    "Back",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: BaseColors.white
                          .withOpacity(_selectedPage == 0 ? 0 : 1),
                    ),
                  ),
                ),
                Row(
                  children: [0, 1, 2]
                      .asMap()
                      .map(
                        (e, i) => MapEntry(
                            i,
                            Container(
                              width: _selectedPage == i ? 20 : 10,
                              height: 10,
                              decoration: BoxDecoration(
                                color: i == _selectedPage
                                    ? Colors.white
                                    : Colors.white.withOpacity(0.3),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              margin: const EdgeInsets.all(4),
                            )),
                      )
                      .values
                      .toList(),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/main');
                    print(ModalRoute.of(context)?.settings.name);
                  },
                  child: const Text(
                    "Skip",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: BaseColors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BoardingWidget extends StatelessWidget {
  const _BoardingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            child: SvgPicture.asset("onboarding.svg"),
          ),
          const SizedBox(
            height: 30,
          ),
          Text(
            "Lorem Ipsum",
            style: TextStyle(
              color: Colors.grey[800],
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "Lorem Ipsum \n Lorem Ipsum.",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey[500],
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          )
        ],
      ),
    );
  }
}

class OnboardingClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height * 0.82);
    var firstControlPoint = Offset(size.width * 0.075, size.height * 0.8 + 40);
    var firstEndPoint = Offset(size.width * 0.15, size.height * 0.85);
    path.quadraticBezierTo(
      firstControlPoint.dx,
      firstControlPoint.dy,
      firstEndPoint.dx,
      firstEndPoint.dy,
    );

    path.lineTo(size.width * 0.17, size.height * 0.85);
    path.lineTo(size.width * 0.28, size.height * 0.85);

    var secControlPoint = Offset(size.width * 0.32, size.height * 0.85);
    var secEndPoint = Offset(size.width * 0.33, size.height * 0.87);
    path.quadraticBezierTo(
      secControlPoint.dx,
      secControlPoint.dy,
      secEndPoint.dx,
      secEndPoint.dy,
    );

//     path.lineTo(size.width * 0.37, size.height * 0.87);
//     path.lineTo(size.width * 0.4, size.height * 0.9);

    var thirdControlPoint = Offset(size.width * 0.4, size.height * 0.89 + 30);
    var thirdEndPoint = Offset(size.width * 0.5, size.height * 0.92);
    path.quadraticBezierTo(
      thirdControlPoint.dx,
      thirdControlPoint.dy,
      thirdEndPoint.dx,
      thirdEndPoint.dy,
    );

    var fourControlPoint = Offset(size.width * 0.5 + 10, size.height * 0.92);
    var fourEndPoint = Offset(size.width * 0.6 - 10, size.height * 0.89);
    path.quadraticBezierTo(
      fourControlPoint.dx,
      fourControlPoint.dy,
      fourEndPoint.dx,
      fourEndPoint.dy,
    );

    path.lineTo(size.width * 0.6 - 10, size.height * 0.89);

    var fiveControlPoint =
        Offset(size.width * 0.65 - 10, size.height * 0.89 - 30);
    var fiveEndPoint = Offset(size.width * 0.65 + 10, size.height * 0.85);
    path.quadraticBezierTo(
      fiveControlPoint.dx,
      fiveControlPoint.dy,
      fiveEndPoint.dx,
      fiveEndPoint.dy,
    );

    path.lineTo(size.width * 0.65 + 10, size.height * 0.85);
    path.lineTo(size.width * 0.85, size.height * 0.85);

    var lastControlPoint =
        Offset(size.width * 0.85 + 40, size.height * 0.85 - 5);
    var lastEndPoint = Offset(size.width, size.height * 0.81);
    path.quadraticBezierTo(
      lastControlPoint.dx,
      lastControlPoint.dy,
      lastEndPoint.dx,
      lastEndPoint.dy,
    );

    path.lineTo(size.width, size.height * 0.8);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class GreenClipper extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height * 0.65);

    var firstControlPoint = Offset(size.width * 0.2, size.height * 0.6);
    var firstEndPoint = Offset(size.width * 0.45, size.height * 0.65);
    path.quadraticBezierTo(
      firstControlPoint.dx,
      firstControlPoint.dy,
      firstEndPoint.dx,
      firstEndPoint.dy,
    );

    var secondControlPoint =
        Offset(size.width * 0.75, (size.height * 0.65) + 65);
    var secondEndPoint = Offset(size.width, size.height * 0.65);
    path.quadraticBezierTo(
      secondControlPoint.dx,
      secondControlPoint.dy,
      secondEndPoint.dx,
      secondEndPoint.dy,
    );

    path.lineTo(size.width, size.height / 3);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}

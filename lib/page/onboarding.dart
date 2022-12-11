import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getwidget/getwidget.dart';
import 'package:sehat_terus/core/colors.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : BaseColors.black.withOpacity(0.3),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.1, 0.4, 0.9],
              colors: [
                Color.fromARGB(255, 210, 241, 246),
                Color.fromARGB(255, 182, 224, 230),
                BaseColors.green,
              ],
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                    alignment: Alignment.centerRight,
                    child: GFButton(
                      color: Colors.transparent,
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, "/main");
                      },
                      child: Text(
                        'Skip',
                        style: TextStyle(
                          color: BaseColors.black,
                          fontSize: 20.0,
                        ),
                      ),
                    )),
                Container(
                  height: _currentPage != _numPages - 1? 550.0: 500,
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: AssetImage(
                                  'assets/onboarding4.png',
                                ),
                                height: 300.0,
                                width: 300.0,
                              ),
                            ),
                            SizedBox(height: 30.0),
                            Text(
                              'Find out the latest news about Covid-19.',
                              style: kTitleTextstyle,
                            ),
                            SizedBox(height: 10.0),
                            Text(
                              'relevant and reliable',
                              style: TextStyle(
                                color: BaseColors.grey.withOpacity(0.9),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: AssetImage(
                                  'assets/onboarding5.png',
                                ),
                                height: 300.0,
                                width: 300.0,
                              ),
                            ),
                            SizedBox(height: 30.0),
                            Text(
                              'Track updated Covid-19 data',
                              style: kTitleTextstyle,
                            ),
                            SizedBox(height: 15.0),
                            Text(
                              'throughout Indonesia',
                              style: TextStyle(
                                color: BaseColors.grey.withOpacity(0.9),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: AssetImage(
                                  'assets/onboarding6.png',
                                ),
                                height: 300.0,
                                width: 300.0,
                              ),
                            ),
                            SizedBox(height: 30.0),
                            Text(
                              'Login as Lurah and Nakes to control Sehat Terus district',
                              style: kTitleTextstyle,
                            ),
                            SizedBox(height: 15.0),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildPageIndicator(),
                  ),
                ),
                _currentPage != _numPages - 1
                    ? Expanded(
                        child: Align(
                          alignment: FractionalOffset.bottomRight,
                          child: GFButton(
                            color: Colors.transparent,
                            onPressed: () {
                              _pageController.nextPage(
                                duration: Duration(milliseconds: 100),
                                curve: Curves.ease,
                              );
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  'Next',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20.0,
                                  ),
                                ),
                                SizedBox(width: 5.0),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.black,
                                  size: 18.0,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : Container(
                      margin: EdgeInsets.only(top: 25, left: 60, right: 60),

                        child: GFButton(
                          padding: EdgeInsets.all(0),
                            color: BaseColors.white,
                            shape: GFButtonShape.pills,
                            text: "Get Started",
                            type: GFButtonType.solid,
                            // textStyle: TextStyle(fontWeight: FontWeight.bold),
                            textColor: BaseColors.black,
                            onPressed: () {
                              Navigator.pushReplacementNamed(context, "/main");
                            }),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

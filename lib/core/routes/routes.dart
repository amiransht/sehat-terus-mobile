import 'package:flutter/material.dart';
import 'package:sehat_terus/page/home_page.dart';
import 'package:sehat_terus/page/onboarding.dart';


class Routes {
  static const onBoarding = "/";
  static const home = "/home";
}

class RouterGenerator {
  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Routes.onBoarding:
        return MaterialPageRoute(
          builder: ((context) => const OnboardingScreen()),
        );
      case Routes.home:
        return MaterialPageRoute(
          builder: ((context) => const HomePage()),
        );
      // case Routes.todaysTask:
      //   return MaterialPageRoute(
      //     builder: ((context) => const TodaysTaskScreen()),
      //   );
      default:
        return MaterialPageRoute(
          builder: ((context) => const HomePage()),
        );
    }
  }
}

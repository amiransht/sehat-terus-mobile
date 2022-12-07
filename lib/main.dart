import 'package:flutter/material.dart';
import 'package:sehat_terus/page/about.dart';
import 'package:sehat_terus/page/data_statistik.dart';
import 'package:sehat_terus/page/home_page.dart';
import 'package:sehat_terus/page/onboarding.dart';
import 'package:sehat_terus/page/article_page.dart';
void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Management',
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      // onGenerateRoute: RouteGenerator.generateRoute,

      routes: {
        '/home': (context) => HomePage(),
        '/data': (context) => const DataPage(),
        '/article': (context) => const ArticlePage(),
        '/about': (context) => const AboutPage(),
        '/': (context) => const OnboardingScreen(),
      }
    );
  }
}

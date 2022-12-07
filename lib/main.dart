import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:sehat_terus/page/about.dart';
import 'package:sehat_terus/page/data_statistik.dart';
import 'package:sehat_terus/page/home_page.dart';
import 'package:sehat_terus/page/login_page.dart';
import 'package:sehat_terus/page/main_page.dart';
import 'package:sehat_terus/page/onboarding.dart';
import 'package:sehat_terus/page/article_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      child: MaterialApp(
        title: 'Sehat Terus',
        // theme: ThemeData(
        //   primarySwatch: Colors.blue,
        // ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const OnboardingScreen(),
          '/main': (context) => const MainPage(),
          '/login': (BuildContext context) => const LoginPage(),
          '/home': (context) => HomePage(),
          '/data': (context) => const DataPage(),
          '/article': (context) => const ArticlePage(),
          '/about': (context) => const AboutPage(),
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:sehat_terus/page/data_statistik.dart';
import 'package:sehat_terus/page/home_page.dart';
import 'package:sehat_terus/page/login_page.dart';
import 'package:sehat_terus/page/onboarding.dart';
import 'package:sehat_terus/page/article_page.dart';
import 'core/routes/routes.dart';
import 'package:provider/provider.dart';

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
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => const OnboardingScreen(),
          '/login': (BuildContext context) => const LoginPage(),
          '/home': (context) => HomePage(),
          '/data': (context) => const DataPage(),
          '/article': (context) => const ArticlePage(),
        },
      ),
    );
  }
}

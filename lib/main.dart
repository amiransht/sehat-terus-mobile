import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:sehat_terus/page/about.dart';
import 'package:sehat_terus/page/blog_page.dart';
import 'package:sehat_terus/page/detail_blog.dart';
import 'package:sehat_terus/page/data_statistik.dart';
import 'package:sehat_terus/page/formBlog_page.dart';
import 'package:sehat_terus/page/home_page.dart';
import 'package:sehat_terus/page/login_pageui.dart';
import 'package:sehat_terus/page/main_page.dart';
import 'package:sehat_terus/page/nakes_page.dart';
import 'package:sehat_terus/page/onboarding.dart';
import 'package:sehat_terus/page/article_page.dart';
import 'package:sehat_terus/page/faq_page.dart';
import 'package:sehat_terus/page/profilepage.dart';
import 'package:sehat_terus/page/signup_page.dart';

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
          fontFamily: 'Poppins',
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/main',
        routes: {
          '/': (context) => const OnboardingScreen(),
          '/main': (context) => const MainPage(),
          // '/login': (BuildContext context) => const LoginPage(),
          '/login': (context) => const LoginApp(),
          '/home': (context) => HomePage(),
          '/data': (context) => const DataPage(),
          '/article': (context) => const ArticlePage(),
          '/about': (context) => const AboutPage(),
          '/faq': (context) => const FaqPage(),
          '/formblog': (context) => const BlogFormPage(),
          '/blog': (context) => const BlogPage(),
          '/detailblog': (context) => const DetailBlogPage(),
          '/nakes': (context) => const NakesPage(),
          '/signup': (context) => const SignUpApp(),
          '/profile': (context) => const Profile(),
        },
      ),
    );
  }
}

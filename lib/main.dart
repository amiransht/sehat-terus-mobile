import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:sehat_terus/page/about/about.dart';
import 'package:sehat_terus/page/authentication/coba.dart';
import 'package:sehat_terus/page/lurah/add_pasien.dart';
import 'package:sehat_terus/page/faq%20and%20blog/blog_page.dart';
import 'package:sehat_terus/page/faq%20and%20blog/detail_blog.dart';
import 'package:sehat_terus/page/data%20statistik/data_statistik.dart';
import 'package:sehat_terus/page/faq%20and%20blog/formBlog_page.dart';
import 'package:sehat_terus/page/homepage/home_page.dart';
import 'package:sehat_terus/page/authentication/login_pageui.dart';
import 'package:sehat_terus/page/main_page.dart';
import 'package:sehat_terus/page/nakes/nakes_page.dart';
import 'package:sehat_terus/page/onboarding.dart';
import 'package:sehat_terus/page/homepage/article_page.dart';
import 'package:sehat_terus/page/faq%20and%20blog/faq_page.dart';
import 'package:sehat_terus/page/authentication/profilepage.dart';
import 'package:sehat_terus/page/lurah/show_pasien.dart';
import 'package:sehat_terus/page/authentication/signup_page.dart';

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
        initialRoute: '/showpasien',
        routes: {
          '/': (context) => OnboardingScreen(),
          '/main': (context) => MainPage(setPageAtIndex: 0),
          // '/login': (BuildContext context) => const LoginPage(),
          '/login': (context) => const LoginApp(),
          '/home': (context) => HomePage(),
          '/data': (context) => const DataPage(),
          '/article': (context) => const ArticlePage(),
          '/about': (context) => const AboutPage(),
          '/faq': (context) => const FaqPage(),
          '/formblog': (context) => const BlogFormPage(),
          '/blog': (context) => const BlogPage(),
          '/main/detailblog': (context) => const DetailBlogPage(),
          '/nakes': (context) => const NakesPage(),
          '/signup': (context) => const SignUpApp(),
          '/profile': (context) => const Profile(),
          '/addpasien': (context) => const PasienForm(),
          '/showpasien': (context) => const LurahPage(),
          '/profilescreen': (context) => const ProfileScreen(),
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sehat_terus/core/colors.dart';
import 'package:sehat_terus/models/user_role.dart';
import 'package:sehat_terus/page/authentication/coba.dart';
import 'package:sehat_terus/page/faq%20and%20blog/blog_page.dart';
import 'package:sehat_terus/page/faq%20and%20blog/faq_page.dart';
import 'package:sehat_terus/page/homepage/home_page.dart';
import 'package:sehat_terus/page/data%20statistik/data_statistik.dart';
import 'package:sehat_terus/page/authentication/login_pageui.dart';
import 'package:sehat_terus/page/authentication/logout.dart';
import 'package:sehat_terus/page/authentication/profilepage.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:sehat_terus/models/user_profile.dart';

class MainPage extends StatefulWidget {
  final int? setPageAtIndex;
  final User? userLoggedIn;
  const MainPage({Key? key, this.setPageAtIndex, this.userLoggedIn})
      : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late int _selectedIndex;
  late User? userLoggedIn;

  @override
  void initState() {
    _selectedIndex = widget.setPageAtIndex ?? 0;
    userLoggedIn = widget.userLoggedIn;

    super.initState();
  }

  final List<BottomNavigationBarItem> _tabsButton =
      const <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.bar_chart_outlined),
      label: 'Data',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.feed_outlined),
      label: 'Blog',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Profil',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    print("udh login?");
    print(userLoggedIn?.isLoggedIn);

    return SafeArea(
        child: Scaffold(
      body: <Widget>[
        HomePage(user: userLoggedIn),
        DataPage(user: userLoggedIn),
        BlogPage(user: userLoggedIn),
        // ProfileScreen()
        ProfileScreen(user: userLoggedIn)
      ].elementAt(_selectedIndex),
      bottomNavigationBar: Container(
          height: 69.0,
          child: BottomNavigationBar(
            items: _tabsButton,
            type: BottomNavigationBarType.fixed,
            currentIndex: _selectedIndex,
            selectedItemColor: BaseColors.green,
            selectedFontSize: 12.0,
            unselectedItemColor: BaseColors.black,
            showUnselectedLabels: true,
            onTap: (index) {
              setState(() {
                _selectedIndex = index;
              });
            },
          )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: BaseColors.green,
        onPressed: () {
          // showDialog(context: context,
          // builder: (BuildContext context){
          //   return _alert.Alert();
          // },);
        },
        // onPressed: () => setState(() {
        //   _count++;
        //   print('You like Indonesia $_count time(s)');

        // }),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    ));
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sehat_terus/core/colors.dart';
import 'package:sehat_terus/models/user_role.dart';
import 'package:sehat_terus/page/blog_page.dart';
import 'package:sehat_terus/page/faq_page.dart';
import 'package:sehat_terus/page/home_page.dart';
import 'package:sehat_terus/page/data_statistik.dart';
import 'package:sehat_terus/page/login_pageui.dart';
import 'package:sehat_terus/page/logout.dart';
import 'package:sehat_terus/page/profilepage.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class MainPage extends StatefulWidget {
  final int? setPageAtIndex;
  const MainPage({
    Key? key,
    this.setPageAtIndex,}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late int _selectedIndex;

  final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    DataPage(),
    BlogPage(),
    Profile()
  ];

  @override
  void initState() {
    _selectedIndex = widget.setPageAtIndex ?? 0;
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
    // IS LURAH
    final args = ModalRoute.of(context)!.settings.arguments == null
        ? false
        : ModalRoute.of(context)!.settings.arguments as bool;
    print("lurah kh?");
    print(args);
    print("logged in kh? ");
    print(request.loggedIn);
    return SafeArea(
        child: Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
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

import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

import 'package:sehat_terus/appbar.dart';
import 'package:sehat_terus/core/colors.dart';
import 'package:sehat_terus/drawer.dart';
import 'package:sehat_terus/widget/circle_gradient_icon.dart';
import 'package:sehat_terus/widget/section5m.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
  
}

class _MyHomePageState extends State<MyHomePage> {
  Color _iconPressed = Colors.black;
  PageController _navPage = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: buildAppBar(context),
          drawer: buildDrawer(context),
          extendBody: true,
          body: SingleChildScrollView(
              child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              _buildCarousel(),
              const SizedBox(
                height: 30,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _5mHeader(),
                    const SizedBox(
                      height: 20,
                    ),
                    buildGrid(),
                  ],
                ),
              ),
            ],
          )),
          bottomNavigationBar: BottomAppBar(
              shape: const CircularNotchedRectangle(),
              child: Container(
                height: 60.0,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      iconSize: 35,
                      padding: EdgeInsets.only(left: 28.0),
                      icon: Icon(Icons.home, color: (_iconPressed)), 
                      onPressed: () { 
                        setState(() {
                          _navPage.jumpToPage(0);
                          _iconPressed = Colors.red;
                      });}),
                    IconButton(
                      iconSize: 35,
                      icon: Icon(Icons.search), 
                      onPressed: () { 
                        setState(() {
                          _navPage.jumpToPage(1);
                      });}),
                    IconButton(
                      iconSize: 35,
                      icon: Icon(Icons.bookmark), 
                      onPressed: () { 
                        setState(() {
                          _navPage.jumpToPage(2);
                      });}),
                    IconButton(
                      iconSize: 35,
                      padding: EdgeInsets.only(right: 28.0),
                      icon: Icon(Icons.settings), 
                      onPressed: () { 
                        setState(() {
                          _navPage.jumpToPage(3);
                      });}),
                    
                  ],
                ),
                ),
            ),
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
            
          ),
    );
  }

  GFCarousel _buildCarousel() {
    final List<String> imageList = [
      "assets/banner1.png",
      "assets/banner3.png",
      "assets/banner4.png",
    ];
    return GFCarousel(
      items: imageList.map(
        (path) {
          return Container(
            margin: EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              child: Image.asset(path, fit: BoxFit.cover),
            ),
          );
        },
      ).toList(),
      aspectRatio: 16/9,
      height: 180,
      autoPlay: true,
      autoPlayInterval: const Duration(seconds: 3),
      autoPlayCurve: Curves.fastOutSlowIn,
      enableInfiniteScroll: true,
      autoPlayAnimationDuration: const Duration(milliseconds: 800),
      viewportFraction: 0.8,
      scrollDirection: Axis.horizontal,
      hasPagination: true,
      activeIndicator: BaseColors.white,
      passiveIndicator: Colors.grey,
      pagerSize: 6.0,
      enlargeMainPage: true,
    );
  }

  Column _5mHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Waspada Penularan COVID-19",
          style: TextStyle(
            color: Colors.blueGrey[900],
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'Lindungi diri dan keluarga dari Covid-19 dengan protokol 5m',
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  StaggeredGrid buildGrid() {
    return StaggeredGrid.count(
      crossAxisCount: 6,
      mainAxisSpacing: 15,
      crossAxisSpacing: 10,
      children: [
        StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 2,
          child: Section5mContainer(
            color: BaseColors.green,
            image: Image.asset(
              "assets/5m-5.png",
              height: 60,
            ),
            space: 10,
            title: "Memakai Masker",
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 2,
          child: Section5mContainer(
            color: BaseColors.green,
            image: Image.asset(
              "assets/5m-3.png",
              height: 70,
            ),
            space: 5,
            title: "Menjaga Jarak",
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 2,
          mainAxisCellCount: 2,
          child: Section5mContainer(
            color: BaseColors.green,
            image: Image.asset(
              "assets/5m-7.png",
              height: 75,
            ),
            space: 0,
            title: "Mencuci Tangan",
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 3,
          mainAxisCellCount: 2,
          child: Section5mContainer(
            color: BaseColors.green,
            image: Image.asset(
              "assets/5m-2.png",
              height: 60,
            ),
            space: 10,
            title: "Menjauhi Kerumunan",
          ),
        ),
        StaggeredGridTile.count(
          crossAxisCellCount: 3,
          mainAxisCellCount: 2,
          child: Section5mContainer(
            color: BaseColors.green,
            image: Image.asset(
              "assets/5m-6.png",
              height: 70,
            ),
            space: 5,
            title: "Membatasi Mobilitas",
          ),
        ),
      ],
    );
  }
}

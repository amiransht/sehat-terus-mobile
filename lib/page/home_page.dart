import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

import 'package:sehat_terus/appbar.dart';
import 'package:sehat_terus/core/colors.dart';
import 'package:sehat_terus/drawer.dart';
import 'package:sehat_terus/models/article_model.dart';
import 'package:sehat_terus/widget/section5m.dart';
import 'package:sehat_terus/widget/image_container.dart';

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
                        _NewsHeader(),
                        const SizedBox(
                          height: 20,
                        ),
                        _BreakingNews(articles: Article.articles),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                ],
              )
          ),
          bottomNavigationBar: _buildBottomAppBar(),
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

  Column _NewsHeader() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Berita Terkini",
          style: TextStyle(
            color: Colors.blueGrey[900],
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Text(
          'Lihat berita terbaru seputar Covid-19 dan Vaksinasi disini',
          style: TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
  
  
  BottomAppBar _buildBottomAppBar(){
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      child: Container(
        height: 69.0,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  iconSize: 30,
                  icon: Icon(Icons.home, color: (_iconPressed)), 
                  onPressed: () { 
                    setState(() {
                      _navPage.jumpToPage(0);
                      _iconPressed = Colors.red;
                  });}),
                  Text("Home", textAlign: TextAlign.center, style: TextStyle(fontSize: 12)),
                  SizedBox(height: 5,)
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  iconSize: 30,
                  icon: Icon(Icons.bar_chart_outlined), 
                  onPressed: () { 
                    setState(() {
                      _navPage.jumpToPage(1);
                  });}),
                  Text("Data", textAlign: TextAlign.center, style: TextStyle(fontSize: 12)),
                  SizedBox(height: 5,)
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  iconSize: 30,
                  icon: Icon(Icons.feed_outlined), 
                  onPressed: () { 
                    setState(() {
                      _navPage.jumpToPage(2);
                  });}),
                  Text("Blog", textAlign: TextAlign.center, style: TextStyle(fontSize: 12)),
                  SizedBox(height: 5,)
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  iconSize: 30,
                  icon: Icon(Icons.person), 
                  onPressed: () { 
                    setState(() {
                      _navPage.jumpToPage(3);
                  });}),
                  Text("Profil", textAlign: TextAlign.center, style: TextStyle(fontSize: 12)),
                  SizedBox(height: 5,)
              ],
            ),
          ],
        ),
        ),
    );
  }
}

class _BreakingNews extends StatelessWidget {
  const _BreakingNews({
    Key? key,
    required this.articles,
  }) : super(key: key);

  final List<Article> articles;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 0),
      child: Column(
        children: [
          SizedBox(
            height: 250,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    margin: const EdgeInsets.only(right: 10),
                    child: InkWell(
                      // onTap: (){
                      //   Navigator.pushNamed(context, ArticleScreen.routeName, arguments: articles[index]);
                      // },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ImageContainer(
                              width: MediaQuery.of(context).size.width * 0.5,
                              image: articles[index].image),
                          const SizedBox(height: 10),
                          Text(
                            articles[index].title,
                            maxLines: 2,
                            style: Theme.of(context).textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.normal, height: 1.5),
                          ),
                          const SizedBox(height: 5),
                          Text(
                              articles[index].createdAt,
                              style: Theme.of(context).textTheme.bodySmall),
                          const SizedBox(height: 5),
                          Text('by ${articles[index].author}',
                              style: Theme.of(context).textTheme.bodySmall),
                        ],
                      ),
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}

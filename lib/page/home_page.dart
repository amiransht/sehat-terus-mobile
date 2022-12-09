import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

import 'package:sehat_terus/appbar.dart';
import 'package:sehat_terus/core/colors.dart';
import 'package:sehat_terus/models/article_model.dart';
import 'package:sehat_terus/page/article_page.dart';
import 'package:sehat_terus/page/data_statistik.dart';
import 'package:sehat_terus/page/onboarding.dart';
import 'package:sehat_terus/widget/section5m.dart';
import 'package:sehat_terus/widget/image_container.dart';
import 'package:sehat_terus/widget/card.dart';
import 'package:sehat_terus/widget/banner.dart';
import 'package:sehat_terus/widget/my_header.dart';
import 'package:sehat_terus/widget/title.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = ScrollController();
  double offset = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.addListener(onScroll);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  void onScroll() {
    setState(() {
      offset = (controller.hasClients) ? controller.offset : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    Article article = Article.articles[0];
    return SafeArea(
      child: Scaffold(
        extendBody: true,
        body: SingleChildScrollView(
            controller: controller,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyHeader(
                  image: "assets/icons/Drcorona.svg",
                  textTop: "Get to know",
                  textBottom: "About COVID-19.",
                  offset: offset,
                  isHome: true,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 5,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleHeader(
                          textTop: "Waspada Penularan COVID-19",
                          textBottom:
                              "Lindungi diri dan keluarga dari Covid-19 dengan protokol 5m"),
                      const SizedBox(
                        height: 20,
                      ),
                      buildGrid(),
                      const SizedBox(
                        height: 30,
                      ),
                      TitleHeader(
                          textTop: "Gejala Covid-19",
                          textBottom:
                              'Periksakan diri Anda saat mengalami gejala berikut'),
                      SizedBox(height: 20),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            CardContainer(
                              image: "assets/headache.png",
                              title: "Sakit kepala",
                            ),
                            CardContainer(
                              image: "assets/caugh.png",
                              title: "Batuk",
                            ),
                            CardContainer(
                              image: "assets/fever.png",
                              title: "Demam",
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                banner(context),
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleHeader(
                          textTop: "Berita Terkini",
                          textBottom:
                              'Lihat berita terbaru seputar Covid-19 dan Vaksinasi disini'),
                      const SizedBox(
                        height: 20,
                      ),
                      _BreakingNews(articles: Article.articles),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 10,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TitleHeader(
                          textTop: "Butuh Bantuan?"),
                      const SizedBox(
                        height: 10,
                      ),
                      _buildBantuan(),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            )),
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
            margin: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(10.0)),
              child: Image.asset(path, fit: BoxFit.cover),
            ),
          );
        },
      ).toList(),
      aspectRatio: 16 / 9,
      height: 240,
      autoPlay: true,
      autoPlayInterval: const Duration(seconds: 3),
      autoPlayCurve: Curves.fastOutSlowIn,
      enableInfiniteScroll: true,
      autoPlayAnimationDuration: const Duration(milliseconds: 800),
      viewportFraction: 0.9,
      scrollDirection: Axis.horizontal,
      hasPagination: true,
      activeIndicator: BaseColors.white,
      passiveIndicator: Colors.grey,
      pagerSize: 6.0,
      enlargeMainPage: true,
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

  StaggeredGrid _buildBantuan() {
    return StaggeredGrid.count(
      crossAxisCount: 6,
      crossAxisSpacing: 15,
      children: [
        StaggeredGridTile.count(
            crossAxisCellCount: 3,
            mainAxisCellCount: 0.8,
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 146, 223, 234).withOpacity(0.4),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 4),
                      blurRadius: 30,
                      color: kShadowColor,
                    ),
                  ],
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/about');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const <Widget>[
                      Icon(Icons.info_outline),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Tentang Aplikasi",
                        style: TextStyle(
                          color: Colors.black,
                          letterSpacing: 0.2,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ))),
        StaggeredGridTile.count(
            crossAxisCellCount: 3,
            mainAxisCellCount: 0.8,
            child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 146, 223, 234).withOpacity(0.4),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 4),
                      blurRadius: 30,
                      color: kShadowColor,
                    ),
                  ],
                ),
                child: InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/faq');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const <Widget>[
                      Icon(Icons.question_answer_outlined),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "FAQ",
                        style: TextStyle(
                          color: Colors.black,
                          letterSpacing: 0.5,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ))),
      ],
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
    return Container(
      child: Column(
        children: [
          SizedBox(
            height: 230,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: articles.length,
                itemBuilder: (context, index) {
                  return Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    margin: const EdgeInsets.only(right: 10),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/article',
                            arguments: articles[index]);
                        print(ModalRoute.of(context)!.settings.arguments);
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: BaseColors.white.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: BaseColors.grey.withOpacity(0.7),
                              blurRadius: 3,
                              spreadRadius: 1,
                              offset: const Offset(0, 3),
                            )
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ImageContainer(
                                width: MediaQuery.of(context).size.width * 0.5,
                                image: articles[index].image),
                            const SizedBox(height: 10),
                            Container(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      articles[index].title,
                                      maxLines: 2,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                              fontWeight: FontWeight.normal,
                                              height: 1.5),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(articles[index].createdAt,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall),
                                    const SizedBox(height: 5),
                                    Text('by ${articles[index].author}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall),
                                  ],
                                )),
                          ],
                        ),
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

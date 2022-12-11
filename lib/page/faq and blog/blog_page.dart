import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sehat_terus/data_source/api_blog.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:sehat_terus/appbar.dart';
import 'package:sehat_terus/models/blog.dart';
import 'package:sehat_terus/core/colors.dart';
import 'package:getwidget/getwidget.dart';
import 'package:sehat_terus/page/faq%20and%20blog/detail_blog.dart';
import 'package:getwidget/getwidget.dart';

import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:sehat_terus/appbar.dart';
import 'package:sehat_terus/core/colors.dart';
import 'package:sehat_terus/widget/title.dart';
import 'package:sehat_terus/models/user_profile.dart';

class BlogPage extends StatefulWidget {
  final User? user;
  const BlogPage({Key? key, this.user}) : super(key: key);

  @override
  _BlogPageState createState() => _BlogPageState();
}

class _BlogPageState extends State<BlogPage> {
  @override
  Widget build(BuildContext context) {
    print("blog: nakes? ");
    print(widget.user?.isNakes);
    final request = context.watch<CookieRequest>();
    // TODO: implement build
    return Container(
        margin: const EdgeInsets.all(0),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color.fromARGB(255, 152, 238, 255),
              BaseColors.green,
            ],
          ),
          // color: BaseColors.green,
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          extendBodyBehindAppBar: true,
          body: Container(
            margin: const EdgeInsets.only(top: 10),
            child: FutureBuilder(
                future: fetchBlog(request),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.data == null) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    if (!snapshot.hasData) {
                      return Column(
                        children: const [
                          Text(
                            "Tidak ada watch list :(",
                            style: TextStyle(
                                color: Color(0xff59A5D8), fontSize: 20),
                          ),
                          SizedBox(height: 8),
                        ],
                      );
                    } else {
                      return ListView.builder(
                          //physics: const AlwaysScrollableScrollPhysics(),
                          //shrinkWrap: true,
                          itemCount: snapshot.data!.length,
                          itemBuilder: (_, index) => GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    settings: RouteSettings(arguments:snapshot.data![index] ),
                                    builder: (context) => DetailBlogPage(
                                      user:widget.user,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                margin: const EdgeInsets.all(10.0),
                                padding: const EdgeInsets.all(20.0),
                                decoration: BoxDecoration(
                                  color: BaseColors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  // borderRadius: BorderRadius.all(
                                  //   Radius.circular(20)),
                                  // border: Border(
                                  //     bottom: BorderSide(
                                  //         color: BaseColors.black.withOpacity(0.3),
                                  //         width: 0.5)),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    //AUTHOR
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.person,
                                          size: 16,
                                        ),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        Text("Amira Nisrina",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Text(
                                                "${snapshot.data![index].title}",
                                                style: const TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w600)),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text("Nov 1, 2022",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                const Text("|"),
                                                const SizedBox(
                                                  width: 5,
                                                ),
                                                Text("Politics",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall),
                                              ],
                                            )
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 0),
                                          child: Image.asset(
                                            "assets/news5.png",
                                            width: 100,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              )));
                    }
                  }
                }),
          ),
          // ]),
        ));
  }
}

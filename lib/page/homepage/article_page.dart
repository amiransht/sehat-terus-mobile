import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:sehat_terus/core/colors.dart';
import 'package:sehat_terus/widget/image_container.dart';
import 'package:sehat_terus/models/user_profile.dart';
import 'package:sehat_terus/page/main_page.dart';

import '../../models/artikel.dart';
// import '../widgets/custom_tag.dart';

class ArticlePage extends StatelessWidget {
  final User? user;
  const ArticlePage({Key? key, this.user}) : super(key: key);
  static const routeName = '/article';

  @override
  Widget build(BuildContext context) {
    print("artikel: nakes? ");
    print(user?.isNakes);
    final article = ModalRoute.of(context)!.settings.arguments as Article;

    return ImageContainer(
        width: double.infinity,
        image: article.image,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            leading: IconButton(
              padding: EdgeInsets.only(left: 20),
              hoverColor: BaseColors.white.withOpacity(0.3),
              highlightColor: BaseColors.white.withOpacity(0.3),
              icon: Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MainPage(
                                    setPageAtIndex: 0, userLoggedIn: user,
                                  ),
                                ),
                              ),
            ),
            // iconTheme: const IconThemeData(color: Colors.black),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          extendBodyBehindAppBar: true,
          body: ListView(
            children: [
              _NewsHeadline(
                article: article,
              ),
              _NewsBody(article: article)
            ],
          ),
        ));
  }
}

class _NewsBody extends StatelessWidget {
  const _NewsBody({
    Key? key,
    required this.article,
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Row(
            children: [
              GFButton(
                onPressed: () {},
                text: article.author,
                type: GFButtonType.outline,
                shape: GFButtonShape.pills,
                color: BaseColors.green,
                // textColor: BaseColors.black,
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
              ),
              const SizedBox(width: 10),
              Row(
                children: [
                  GFButton(
                    onPressed: () {},
                    text: article.createdAt,
                    type: GFButtonType.outline,
                    shape: GFButtonShape.pills,
                    color: BaseColors.green,
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                  ),
                  const SizedBox(width: 10)
                ],
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(article.title,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          Text(article.body,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(height: 1.5)),
          const SizedBox(height: 50),
        ],
      ),
    );
  }
}

class _NewsHeadline extends StatelessWidget {
  const _NewsHeadline({
    Key? key,
    required this.article,
  }) : super(key: key);

  final Article article;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.20,
          ),
          GFButton(
            onPressed: () {},
            text: article.source,
            textStyle:
                TextStyle(fontWeight: FontWeight.bold, color: BaseColors.black),
            type: GFButtonType.solid,
            borderSide: BorderSide(width: 1, color: BaseColors.black),
            shape: GFButtonShape.pills,
            color: BaseColors.white.withOpacity(0.7),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
          ),
          const SizedBox(height: 10),
          // Text(
          //   article.title,
          //   style: Theme.of(context).textTheme.headlineSmall!.copyWith(
          //       fontWeight: FontWeight.bold, color: Colors.white, height: 1.25),
          // ),
          // const SizedBox(height: 10),
        ],
      ),
    );
  }
}

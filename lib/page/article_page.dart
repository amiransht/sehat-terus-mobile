import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:sehat_terus/core/colors.dart';
import 'package:sehat_terus/widget/image_container.dart';

import '../models/article_model.dart';
// import '../widgets/custom_tag.dart';

class ArticlePage extends StatelessWidget {
  const ArticlePage({Key? key}) : super(key: key);
  static const routeName = '/article';

  @override
  Widget build(BuildContext context) {
    final article = ModalRoute.of(context)!.settings.arguments as Article;
    print(article);
    return ImageContainer(
        width: double.infinity,
        image: article.image,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            leading: IconButton(
              hoverColor: BaseColors.white.withOpacity(0.3),
              highlightColor: BaseColors.white.withOpacity(0.3),
              icon: Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: () => Navigator.pushReplacementNamed(context, '/main'),
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
          // GridView.builder(
          //     shrinkWrap: true,
          //     itemCount: 2,
          //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          //       crossAxisCount: 2,
          //       childAspectRatio: 1.25,
          //     ),
          //     itemBuilder: (context, index) {
          //       return ImageContainer(
          //         width: MediaQuery.of(context).size.width * 0.42,
          //         image: article.image,
          //         margin: const EdgeInsets.only(right: 5.0, bottom: 5.0),
          //       );
          //     })
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
            textStyle: TextStyle(fontWeight: FontWeight.bold, color: BaseColors.green),
            type: GFButtonType.solid,
            borderSide: BorderSide(width: 1, color: BaseColors.green),
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

import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:sehat_terus/core/colors.dart';
import 'package:sehat_terus/widget/image_container.dart';

import '../models/data_blog.dart';
// import '../widgets/custom_tag.dart';

class DetailBlogPage extends StatelessWidget {
  const DetailBlogPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final blog = ModalRoute.of(context)!.settings.arguments as DataBlog;
    return ImageContainer(
        width: double.infinity,
        image: "assets/news2.jpeg",
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            leading: IconButton(
                padding: EdgeInsets.only(left: 20),
                hoverColor: BaseColors.white.withOpacity(0.3),
                highlightColor: BaseColors.white.withOpacity(0.3),
                icon: Icon(Icons.arrow_back_ios, color: Colors.white),
                onPressed: () => Navigator.pushReplacementNamed(context, '/blog'),
              ), 
            // iconTheme: const IconThemeData(color: Colors.black),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
          //extendBodyBehindAppBar: true,
          body: ListView(
            children: [
              _NewsHeadline(
                blog: blog,
              ),
              _NewsBody(blog: blog)
            ],
          ),
        ));
  }
}

class _NewsBody extends StatelessWidget {
  const _NewsBody({
    Key? key,
    required this.blog,
  }) : super(key: key);

  final DataBlog blog;

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
          const SizedBox(height: 10),
          Text(blog.title,
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          Text(blog.content,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(height: 1.5)),
          const SizedBox(height: 300),
        ],
      ),
    );
  }
}

class _NewsHeadline extends StatelessWidget {
  const _NewsHeadline({
    Key? key,
    required this.blog,
  }) : super(key: key);

  final DataBlog blog;

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
          // GFButton(
          //   onPressed: () {},
          //   text: blog.source,
          //   textStyle: TextStyle(fontWeight: FontWeight.bold, color: BaseColors.black),
          //   type: GFButtonType.solid,
          //   borderSide: BorderSide(width: 1, color: BaseColors.black),
          //   shape: GFButtonShape.pills,
          //   color: BaseColors.white.withOpacity(0.7),
          //   padding: EdgeInsets.symmetric(horizontal: 12, vertical: 0),
          // ),
          const SizedBox(height: 10),
          Text(
            blog.title,
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                fontWeight: FontWeight.bold, color: Colors.white, height: 1.25),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }
}

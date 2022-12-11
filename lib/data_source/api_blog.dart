import 'package:sehat_terus/models/blog.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

Future<List<Blog>> fetchBlog(request) async {
  var url = 'https://sehat-terus.up.railway.app/faq-page/getblog';
  var response = await request.get(url);

  var data = response;

  // melakukan konversi data json menjadi object ToDo
  List<Blog> dataBlog = [];

  for (var d in data) {
    if (d != null) {
      // print(d);
      dataBlog.add(Blog.fromJson(d));
    }
  }

  return dataBlog;
}

addBlog(request, title, content) async {
  var response = await request.post(
      'https://sehat-terus.up.railway.app/faq-page/submit_blog',
      {"title": title, "content": content});
  // print(title);
  // print(content);
  return response;
}

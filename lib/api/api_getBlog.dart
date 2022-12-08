
import 'package:sehat_terus/models/data_blog.dart';


Future<List<DataBlog>> fetchBlog(request) async {
  var url = 'https://sehat-terus.up.railway.app/faq-page/getblog';
  var response = await request.get(url);

  var data = response;

  // melakukan konversi data json menjadi object ToDo
  List<DataBlog> dataBlog = [];

  for (var d in data) {
    if (d != null) {
      dataBlog.add(DataBlog.fromJson(d));
    }
  }
  return dataBlog;
}

addBlog(request, title, content) async {
  var response = await request.post('https://sehat-terus.up.railway.app/faq-page/submit_blog',
      {"title": title, "content": content});
  return response; 
}
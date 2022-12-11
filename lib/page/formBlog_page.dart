import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:sehat_terus/api/api_getBlog.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:sehat_terus/page/blog_page.dart';
import 'package:sehat_terus/models/user_profile.dart';
import 'package:sehat_terus/page/main_page.dart';

import '../core/colors.dart';

class BlogFormPage extends StatefulWidget {
  final User? user;
  const BlogFormPage({super.key, this.user});

  @override
  State<BlogFormPage> createState() => _BlogFormPageState();
}

class _BlogFormPageState extends State<BlogFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _title = "";
  String _content = "";
  @override
  Widget build(BuildContext context) {
    print("formblog: nakes? ");
    print(widget.user?.isNakes);
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          padding: EdgeInsets.only(left: 20),
          hoverColor: BaseColors.green.withOpacity(0.3),
          highlightColor: BaseColors.green.withOpacity(0.3),
          icon: Icon(Icons.arrow_back_ios, color: BaseColors.green),
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MainPage(
                setPageAtIndex: 2,
                userLoggedIn: widget.user,
              ),
            ),
          ),
        ),
        // iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Contoh: Wabah COVID-19 Merajalela",
                      labelText: "Title",
                      // Menambahkan icon agar lebih intuitif
                      icon: const Icon(Icons.book),
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide:
                              BorderSide(width: 3, color: BaseColors.green)),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        _title = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        _title = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Title tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),
                Padding(
                  // Menggunakan padding sebesar 8 pixels
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Contoh: Sejak 2019 lalu....",
                      labelText: "Content",
                      // Menambahkan icon agar lebih intuitif
                      icon: const Icon(Icons.book),
                      // Menambahkan circular border agar lebih rapi
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    // Menambahkan behavior saat nama diketik
                    onChanged: (String? value) {
                      setState(() {
                        _content = value!;
                      });
                    },
                    // Menambahkan behavior saat data disimpan
                    onSaved: (String? value) {
                      setState(() {
                        _content = value!;
                      });
                    },
                    // Validator sebagai validasi form
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Content tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),
                GFButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      addBlog(request, _title, _content);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainPage(
                            setPageAtIndex: 2,
                            userLoggedIn: widget.user,
                          ),
                        ),
                      );
                    }
                  },
                  text: "Post Blog",
                  size: GFSize.SMALL,
                  type: GFButtonType.outline,
                  shape: GFButtonShape.pills,
                  color: BaseColors.black,
                  splashColor: BaseColors.green,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                ),
                // TextButton(
                //   child: const Text(
                //     "Post Blog",
                //     style: TextStyle(color: Colors.white),
                //   ),
                //   style: ButtonStyle(
                //     backgroundColor:
                //         MaterialStateProperty.all(BaseColors.green),
                //   ),
                //   onPressed: () {
                //     if (_formKey.currentState!.validate()) {
                //       addBlog(request, _title, _content);
                //       Navigator.pushReplacementNamed(context, '/blog');
                //     }
                //   },
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

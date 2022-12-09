import 'package:flutter/material.dart';
import 'package:sehat_terus/api/api_getBlog.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:sehat_terus/page/blog_page.dart';

import '../core/colors.dart';

class BlogFormPage extends StatefulWidget {
  const BlogFormPage({super.key});

  @override
  State<BlogFormPage> createState() => _BlogFormPageState();
}

class _BlogFormPageState extends State<BlogFormPage> {
  final _formKey = GlobalKey<FormState>();
  String _title = "";
  String _content = "";
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BaseColors.green,
        centerTitle: true,
        title: Text('Form'),
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
                        borderRadius: BorderRadius.circular(5.0),
                      ),
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
                        borderRadius: BorderRadius.circular(5.0),
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
                TextButton(
                  child: const Text(
                    "Post Blog",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(BaseColors.green),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      addBlog(request, _title, _content);
                      Navigator.pushReplacementNamed(context, '/blog');
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

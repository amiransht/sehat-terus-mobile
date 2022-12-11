import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:sehat_terus/models/user_profile.dart';
import 'dart:convert' as convert;

import 'package:sehat_terus/data_source/api_pasien.dart';

class LurahPage extends StatefulWidget {
  final User? user;
  const LurahPage({super.key, this.user});

  @override
  State<LurahPage> createState() => _LurahPageState();
}

class _LurahPageState extends State<LurahPage> {
  Color buttonColor = Color.fromRGBO(254, 185, 0, 100);

  @override
  Widget build(BuildContext context) {
    print("lurahpage: nakes? ");
    print(widget.user?.isNakes);
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Data Pasien',
          style: TextStyle(),
        ),
      ),
      body: FutureBuilder(
          future: fetchDataPasien(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return const Center(
                  child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                          Color.fromRGBO(254, 185, 0, 100))));
            } else {
              if (!snapshot.hasData) {
                return Column(
                  children: const [
                    Text(
                      "There is no data yet :(",
                      style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                    ),
                    SizedBox(height: 8),
                  ],
                );
              } else {
                return Container(
                  child: ListView.builder(
                      itemCount: snapshot.data!.length,
                      // gridDelegate:
                      //     SliverGridDelegateWithFixedCrossAxisCount(
                      //         crossAxisCount: 2),
                      itemBuilder: (_, index) => Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 6),
                            padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: buttonColor),
                                borderRadius: BorderRadius.circular(12.0),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Color.fromARGB(255, 180, 167, 167),
                                      blurRadius: 1.0)
                                ]),
                            child: ListTile(
                              onTap: () {},
                              title: Text(
                                "${snapshot.data![index].fields.nama}",
                                style: const TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                              subtitle: Column(
                                children: [
                                  Text(
                                    "${snapshot.data![index].fields.umur}",
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  Text(
                                    "${snapshot.data![index].fields.gender}",
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  Text(
                                    "${snapshot.data![index].fields.gejala}",
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  Text(
                                    "${snapshot.data![index].fields.alamat}",
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  Text(
                                    (snapshot.data![index].fields.isCovid ==
                                            true
                                        ? 'Positif'
                                        : 'Negatif'),
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )),
                );
              }
            }
          }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:sehat_terus/models/data_covid_lokal.dart';
import 'package:sehat_terus/core/colors.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NakesPage extends StatefulWidget {
  const NakesPage({Key? key}) : super(key: key);

  @override
  State<NakesPage> createState() => _NakesPageState();
}

class _NakesPageState extends State<NakesPage> {
  Future<List<DataLokal>> fetchDataLokal() async {
    var url = Uri.parse('https://sehat-terus.up.railway.app/json');
    var response = await http.get(
      url,
    );
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    List<DataLokal> listDataLokal = [];
    for (var d in data) {
      if (d != null) {
        listDataLokal.add(DataLokal.fromJson(d));
      }
    }

    return listDataLokal;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Nakes Page'),
          centerTitle: true,
          leading: IconButton(
            hoverColor: BaseColors.white.withOpacity(0.3),
            highlightColor: BaseColors.white.withOpacity(0.3),
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () => Navigator.pushReplacementNamed(context, '/main'),
          ),
          // iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: const Color(0xFF17A2B8),
          elevation: 0,
        ),
        // extendBodyBehindAppBar: true,
        body: Container(
          padding: const EdgeInsets.all(0.0),
          child: FutureBuilder(
              future: fetchDataLokal(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.data == null) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  if (!snapshot.hasData) {
                    return Column(
                      children: const [
                        Text(
                          "Tidak ada sasien",
                          style: TextStyle(
                              color: Color(0xff59A5D8), fontSize: 20),
                        ),
                        SizedBox(height: 8),
                      ],
                    );
                  } else {
                    return ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (_, index) => Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 16, vertical: 12),
                              padding: const EdgeInsets.all(20.0),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.circular(15.0),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Colors.black,
                                        blurRadius: 2.0)
                                  ]),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.start,
                                crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 50),
                                  Text(
                                    "${snapshot.data![index].fields.nama}",
                                    style: const TextStyle(
                                      fontSize: 30.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  Text(
                                    "${snapshot.data![index].fields.umur}",
                                    style: const TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    "${snapshot.data![index].fields.gender}",
                                    style: const TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    "${snapshot.data![index].fields.gejala}",
                                    style: const TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    "${snapshot.data![index].fields.alamat}",
                                    style: const TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    "Covid: ${snapshot.data![index].fields.isCovid == true ? 'Positif' : 'Negatif'}",
                                    style: const TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ));
                  }
                }
              }
          )
        ));
  }
}

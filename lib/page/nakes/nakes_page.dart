import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:sehat_terus/data_source/api_pasien.dart';
import 'package:sehat_terus/models/pasien.dart';
import 'package:sehat_terus/models/user_profile.dart';
import 'package:sehat_terus/core/colors.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NakesPage extends StatefulWidget {
  final User? user;
  const NakesPage({Key? key, this.user}) : super(key: key);

  @override
  State<NakesPage> createState() => _NakesPageState();
}

class _NakesPageState extends State<NakesPage> {
  bool _isCovidFuture = false;
  @override
  Widget build(BuildContext context) {
    print("nakespage: nakes? ");
    print(widget.user?.isNakes);
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
        body: FutureBuilder(
            future: fetchDataPasien(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return const CircularProgressIndicator();
              } else {
                if (!snapshot.hasData) {
                  return Column(
                    children: const [
                      Text(
                        "Tidak ada pasien",
                        style:
                            TextStyle(color: Color(0xff59A5D8), fontSize: 20),
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
                                borderRadius: BorderRadius.circular(15.0),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black, blurRadius: 2.0)
                                ]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(12.0)),
                                    color:
                                        snapshot.data![index].fields.isCovid ==
                                                true
                                            ? Colors.red
                                            : Colors.green,
                                  ),
                                  child: Text(
                                      snapshot.data![index].fields.isCovid ==
                                              true
                                          ? 'Positif'
                                          : 'Negatif',
                                      style: const TextStyle(
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.normal)),
                                ),
                                Text(
                                  "${snapshot.data![index].fields.nama}",
                                  style: const TextStyle(
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10),
                                Text(
                                  "Umur: ${snapshot.data![index].fields.umur}",
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "Gender: ${snapshot.data![index].fields.gender}",
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "Gejala: ${snapshot.data![index].fields.gejala}",
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  "Alamat: ${snapshot.data![index].fields.alamat}",
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                // UPDATE ISCOVID
                                ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        snapshot.data![index].fields.isCovid =
                                            !snapshot
                                                .data![index].fields.isCovid;
                                      });
                                      updateIsCovid(
                                          !snapshot.data![index].fields.isCovid,
                                          snapshot.data![index].pk);
                                    },
                                    child: Text("Update Pasien")),
                              ],
                            ),
                          ));
                }
              }
            }));
  }
}

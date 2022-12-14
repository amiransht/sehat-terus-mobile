import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:sehat_terus/appbar.dart';
import 'package:sehat_terus/models/user_profile.dart';
import 'dart:convert' as convert;
import 'package:sehat_terus/core/colors.dart';
import 'package:sehat_terus/page/lurah/add_pasien.dart';

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
      appBar: buildAppBar(context, "Lurah Page", widget.user),

      body: FutureBuilder(
          future: fetchDataPasien(),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator(
                    color: BaseColors.green,
                    ));
            } else {
              if (!snapshot.hasData) {
                 return Container(
                    alignment: Alignment.center,
                    child: Text(
                      "Tidak ada pasien",
                      style: TextStyle(color: Color(0xff59A5D8), fontSize: 20),
                    ),
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
                                horizontal: 50, vertical: 20),
                            padding: const EdgeInsets.all(20.0),
                            decoration: BoxDecoration(
                              color: BaseColors.white.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: BaseColors.grey.withOpacity(0.7),
                                  blurRadius: 3,
                                  spreadRadius: 1,
                                  offset: const Offset(0, 3),
                                )
                              ],
                            ),
                            child: Column(
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.all(5.0),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.all(Radius.circular(20)),
                                        color:
                                            snapshot.data![index].fields.isCovid ==
                                                    true
                                                ? Color(0xFFffe2dd)
                                                : Color(0xFFdbeddb),
                                      ),
                                      child: Text(
                                          snapshot.data![index].fields.isCovid ==
                                                  true
                                              ? 'Positif'
                                              : 'Negatif',
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.normal)),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      "${snapshot.data![index].fields.nama}",
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Umur: ${snapshot.data![index].fields.umur}",
                                              style: const TextStyle(
                                                fontSize: 13.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                            Text(
                                              "Gender: ${snapshot.data![index].fields.gender}",
                                              style: const TextStyle(
                                                fontSize: 13.0,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Text(
                                                "Gejala: ${snapshot.data![index].fields.gejala}",
                                                style: const TextStyle(
                                                  fontSize: 13.0,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                              Text(
                                                "Alamat: ${snapshot.data![index].fields.alamat}",
                                                style: const TextStyle(
                                                  fontSize: 13.0,
                                                  fontWeight: FontWeight.normal,
                                                  
                                                ),
                                              ),
                                            ],
                                          ),
                                      ],
                                    ),
                                    const SizedBox(height: 10),

                                  ],
                                ),
                              ],
                            ),
                           
                          )),
                );
              }
            }
          }),
      floatingActionButton: FloatingActionButton(
    
        child: Icon(Icons.add),
        backgroundColor: BaseColors.green,
        onPressed: () {
           Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PasienForm(
                user: widget.user,
              ),
            ),
          );
        },
      ),
      floatingActionButtonLocation:FloatingActionButtonLocation.startFloat ,
    );
  }
}

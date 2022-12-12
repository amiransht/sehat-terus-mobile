import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:sehat_terus/data_source/api_pasien.dart';
import 'package:sehat_terus/models/user_profile.dart';
import 'package:sehat_terus/core/colors.dart';
import 'package:provider/provider.dart';
import 'package:sehat_terus/page/main_page.dart';
import 'package:sehat_terus/appbar.dart';

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
    final request = context.watch<CookieRequest>();
    print("nakespage: nakes? ");
    print(widget.user?.isNakes);
    return Scaffold(
        appBar: buildAppBar(context, "Nakes Page", widget.user),
        // extendBodyBehindAppBar: true,
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
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
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
                              // mainAxisAlignment: MainAxisAlignment.start,
                              // crossAxisAlignment: CrossAxisAlignment.start,
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

                                // const SizedBox(height: 5),

                                // const SizedBox(height: 5),

                                // const SizedBox(height: 10),
                                // UPDATE ISCOVID
                                GFButton(
                                  onPressed: () async {
                                    print("update data");
                                    int id = snapshot.data![index].pk;
                                    // print(
                                    //     "https://sehat-terus.up.railway.app/nakes-page/pasien/update/${id}");

                                    // var response = await request.postJson(
                                    //     "https://sehat-terus.up.railway.app/nakes-page/pasien/update/${id}",
                                    //     json.encode({}));
                                    // print(response);

                                    print(updateIsCovid(id));
                                    setState(() {
                                      // _isCovidFuture = snapshot
                                      //         .data![index].fields.isCovid =
                                      //     updateIsCovid(
                                      //             !snapshot.data![index]
                                      //                 .fields.isCovid,
                                      //             snapshot.data![index].pk)
                                      //         as bool;
                                      // print(snapshot.data![index].fields);
                                      // var response = updateIsCovid(
                                      //     !snapshot
                                      //         .data![index].fields.isCovid,
                                      //     snapshot.data![index].pk,
                                      //     snapshot.data![index].fields);
                                      // print(response);
                                    });
                                  },
                                  child: Text("Update Pasien"),
                                  size: GFSize.SMALL,
                                  type: GFButtonType.outline,
                                  shape: GFButtonShape.pills,
                                  color: BaseColors.black,
                                  splashColor: BaseColors.green,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12, vertical: 0),
                                ),
                              ],
                            ),
                          ));
                }
              }
            }));
  }
}

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:sehat_terus/page/add_pasien.dart';
import '../models/data_pasien_lokal.dart';

Future<List<DataPasienLokal>> dataPasien() async {
  print("fetching data..");
  var url = Uri.parse('https://sehat-terus.up.railway.app/lurah-page/json/');
  var response = await http.get(
    url,
    headers: {
      "Access-Control-Allow-Origin": "*",
      "Content-Type": "application/json",
    },
  );

  // melakukan decode response menjadi bentuk json
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  // melakukan konversi data json menjadi object ToDo

  List<DataPasienLokal> listDataLokal = [];

  for (var d in data) {
    if (d != null) {
      // print(d);
      listDataLokal.add(DataPasienLokal.fromJson(d));
    }
  }
  return listDataLokal;
}

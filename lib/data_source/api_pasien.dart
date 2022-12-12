import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:sehat_terus/page/lurah/add_pasien.dart';
import '../models/pasien.dart';

Future<List<Pasien>> fetchDataPasien() async {
  print("fetching data..");
  var url = Uri.parse('https://sehat-terus.up.railway.app/json');
  var response = await http.get(
    url,
  );
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  List<Pasien> listDataLokal = [];
  for (var d in data) {
    if (d != null) {
      listDataLokal.add(Pasien.fromJson(d));
    }
  }

  return listDataLokal;
}

updateIsCovid(bool isCovidNew, int id) async {
  var response = await http.get(
    Uri.parse(
        "https://sehat-terus.up.railway.app/nakes-page/pasien/update/${id}"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  );
}

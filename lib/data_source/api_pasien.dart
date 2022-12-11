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

Future<bool> updateIsCovid(bool isCovidNew, int id) async {
    var response = await http.post(
        Uri.parse(
            "https://sehat-terus.up.railway.app/nakes-page/pasien/update/${id}"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<bool, bool>{
          // TODO: INI GIMANA BODYNYAAA
          // fields[id].isCovid : isCovidNew,
        }));


    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return isCovidNew;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to update.');
    }
  }

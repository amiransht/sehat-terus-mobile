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

Future<Fields> updateIsCovid(int id) async {
  var response = await http.put(
    Uri.parse(
        "https://sehat-terus.up.railway.app/json/${id}"),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode({}),
  );
  // await http.post(
  //   'https://sehat-terus.up.railway.app/nakes-page/pasien/update/${id}',
  //   jsonEncode({}),

  print(response);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Fields.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    print(response.request?.method);
    throw Exception('Failed to update.');
  }
}
//{"user": 9, "nama": "1", "umur": 1, "gender": "P", "gejala": "Tidak Ada", "alamat": "11", "is_covid": false}
// Map fields = {
  //   "user": 9,
  //   "nama": "1",
  //   "umur": 1,
  //   "gender": "P",
  //   "gejala": "Tidak Ada",
  //   "alamat": "11",
  //   "is_covid": false
  // };
  // fields['is_covid'] = true;

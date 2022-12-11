import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/data_covid.dart';

Future<List<DataCovidIndo>> fetchDataCovid() async {
  var url = Uri.parse('https://data.covid19.go.id/public/api/prov.json');
  var response = await http.get(
    url,
  );
  var data = jsonDecode(utf8.decode(response.bodyBytes));

  List<DataCovidIndo> listDataCovid = [];
  print(data['list_data']);

  for (var d in data['list_data']) {
    if (d != null) {
      listDataCovid.add(DataCovidIndo.fromJson(d));
    }
  }
  return listDataCovid;
}


import 'package:flutter/material.dart';
import 'package:sehat_terus/widget/custom_form_field.dart';
import 'package:sehat_terus/core/colors.dart';
import 'package:sehat_terus/widget/my_header.dart';
import 'package:sehat_terus/widget/counter.dart';
import 'package:sehat_terus/models/data_covid.dart';
import 'package:sehat_terus/models/data_covid_lokal.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DataPage extends StatefulWidget {
  const DataPage({Key? key}) : super(key: key);

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  late Future<List<ListData>> _futureDataCovid;
  late Future<List<DataLokal>> _futureDataLokal;
  CustomFormField customFormField = CustomFormField();
  GlobalKey<FormState> key = GlobalKey<FormState>();
  String _namaProv = "DKI JAKARTA";
  double _positive = 0;
  double _recovered = 0;
  double _death = 0;
  double _totalLokal = 0;
  double _positiveLokal = 0;
  double _recoveredLokal = 0;
  final controller = ScrollController();

  @override
  void initState() {
    Future<List<ListData>> fetchDataCovid() async {
      var url = Uri.parse('https://data.covid19.go.id/public/api/prov.json');
      var response = await http.get(
        url,
      );
      var data = jsonDecode(utf8.decode(response.bodyBytes));
      

      List<ListData> listDataCovid = [];
      //print(data['list_data']);

      for (var d in data['list_data']) {
        if (d != null) {

          listDataCovid.add(ListData.fromJson(d));
        }
      }
      return listDataCovid;
    }

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

    super.initState();
    _futureDataCovid = fetchDataCovid();
    _futureDataLokal = fetchDataLokal();
  }

  void getData(AsyncSnapshot snapshot) {
    for (var d in snapshot.data) {
      if (d.key == _namaProv) {
        _positive = d.jumlahKasus.toDouble() - d.jumlahSembuh.toDouble();
        _death = d.jumlahMeninggal.toDouble();
        _recovered = d.jumlahSembuh.toDouble();
      }
    }
  }

  void getDataLokal(AsyncSnapshot snapshot) {
    if (snapshot.data != null && _totalLokal == 0 
                              && _positiveLokal == 0
                              && _recoveredLokal == 0) {
      _totalLokal = snapshot.data.length.toDouble();
      for (var d in snapshot.data) {
        if (d.fields.isCovid == true) {
          _positiveLokal++;
        } else {
          _recoveredLokal++;

        }
      }
    }
  }

  final List<String> _listProvinsi = <String>[
    'DKI JAKARTA',
    'BANTEN',
    'JAWA BARAT',
    'JAWA TIMUR',
    'JAWA TENGAH',
    'YOGYAKARTA',
    'BALI',
    'NUSA TENGGARA BARAT',
    'NUSA TENGGARA TIMUR',
    'SULAWESI UTARA',
    'SULAWESI BARAT',
    'SULAWESI TENGAH',
    'SULAWESI SELATAN',
    'SULAWESI TENGGARA',
    'GORONTALO',
    'ACEH',
    'SUMATERA UTARA',
    'SUMATERA BARAT',
    'SUMATERA SELATAN',
    'RIAU',
    'KEPULAUAN RIAU',
    'JAMBI',
    'BANGKA BELITUNG',
    'BENGKULU',
    'LAMPUNG',
    'KALIMANTAN UTARA',
    'KALIMANTAN BARAT',
    'KALIMANTAN TENGAH',
    'KALIMANTAN SELATAN',
    'KALIMANTAN TIMUR',
    'MALUTU',
    'MALUKU UTARA',
    'PAPUA BARAT',
    'PAPUA',
    'PAPUA SELATAN',
    'PAPUA TENGAH',
    'PAPUA PEGUNUNGAN',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            padding: EdgeInsets.only(left:25.0),
            hoverColor: BaseColors.white.withOpacity(0.3),
            highlightColor: BaseColors.white.withOpacity(0.3),
            icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
            onPressed: () => Navigator.pushReplacementNamed(context, '/main'),
          ),
          // iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(0.0),
              child: Column(children: [
                MyHeader(
                  image: "assets/icons/Drcorona.svg",
                  textTop: "All you need",
                  textBottom: "is stay at home.",
                  offset: 0,
                  isHome: false,
                ),
                FutureBuilder(
                    future: _futureDataCovid,
                    builder: (context, AsyncSnapshot snapshot) {
                      return Column(
                        children: [
                          //DROPDOWN
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            height: 60,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(
                                color: const Color(0xFFE5E5E5),
                              ),
                            ),
                            child: Row(
                              children: <Widget>[
                                const Icon(
                                  Icons.location_on,
                                  color: BaseColors.green,
                                ),
                                const SizedBox(width: 20),
                                Expanded(
                                  child: DropdownButton(
                                    isExpanded: true,
                                    underline: const SizedBox(),
                                    icon: const Icon(
                                      Icons.keyboard_arrow_down,
                                      color: BaseColors.green,
                                    ),
                                    value: _namaProv,
                                    items: _listProvinsi
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                    //onChanged: (value) {},
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        _namaProv = newValue!;
                                        getData(snapshot);
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          //SECTION DATA KASUS COVID
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //HEADER
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Data Kasus COVID-19",
                                      style: TextStyle(
                                        color: Colors.blueGrey[900],
                                        fontWeight: FontWeight.w700,
                                        fontSize: 18,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    const Text(
                                      'from covid19.go.id',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                //CONTAINER DATA KASUS
                                Container(
                                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          offset: const Offset(0, 4),
                                          blurRadius: 30,
                                          color: kShadowColor,
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Counter(
                                              color: kInfectedColor,
                                              number: _positive,
                                              title: "Positive",
                                            ),
                                        Counter(
                                              color: kRecovercolor,
                                              number: _recovered,
                                              title: "Negative",
                                            ),
                                        Counter(
                                              color: kDeathColor,
                                              number: _death,
                                              title: "Death",
                                            ),
                                        // Container(
                                        //     alignment: Alignment.center,
                                        //     child: Counter(
                                        //       color: kInfectedColor,
                                        //       number: _positive,
                                        //       title: "Positive",
                                        //     )),
                                        // Container(
                                        //     alignment: Alignment.center,
                                        //     child: Counter(
                                        //       color: kRecovercolor,
                                        //       number: _recovered,
                                        //       title: "Negative",
                                        //     )),
                                        // Container(
                                        //     alignment: Alignment.center,
                                        //     child: Counter(
                                        //       color: kDeathColor,
                                        //       number: _death,
                                        //       title: "Death",
                                        //     ))
                                      ],
                                    )),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      );
                    }),
                FutureBuilder(
                    future: _futureDataLokal,
                    builder: (context, AsyncSnapshot snapshot) {
                      getDataLokal(snapshot);
                      return Container(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              //HEADER
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Data Kasus",
                                    style: TextStyle(
                                      color: Colors.blueGrey[900],
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  const Text(
                                    'KELURAHAN SEHAT TERUS',
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              //CONTAINER DATA KASUS
                              Container(
                                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      offset: const Offset(0, 4),
                                      blurRadius: 30,
                                      color: kShadowColor,
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Counter(
                                      color: kInfectedColor,
                                      number: _totalLokal,
                                      title: "Total",
                                    ),
                                    Counter(
                                      color: kRecovercolor,
                                      number: _positiveLokal,
                                      title: "Positive",
                                    ),
                                    Counter(
                                      color: kDeathColor,
                                      number: _recoveredLokal,
                                      title: "Negative",
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                      );
                    }),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        //HEADER SEBARAN KASUS
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const <Widget>[
                            Text(
                              "Sebaran Kasus",
                              style: kTitleTextstyle,
                            ),
                          ],
                        ),
                        //SEBARAN KASUS
                        Container(
                          margin: const EdgeInsets.only(top: 20),
                          padding: const EdgeInsets.all(20),
                          height: 178,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(0, 10),
                                blurRadius: 30,
                                color: kShadowColor,
                              ),
                            ],
                          ),
                          child: Image.asset(
                            "assets/map.png",
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ))
              ])),
        ));
  }
}

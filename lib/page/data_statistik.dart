import 'package:flutter/material.dart';
import 'package:sehat_terus/widget/custom_form_field.dart';
import 'package:sehat_terus/core/colors.dart';
import 'package:sehat_terus/constant.dart';
import 'package:sehat_terus/widget/my_header.dart';
import 'package:sehat_terus/widget/counter.dart';

class DataPage extends StatefulWidget {
  const DataPage({Key? key}) : super(key: key);

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {
  CustomFormField customFormField = CustomFormField();
  GlobalKey<FormState> key = GlobalKey<FormState>();
  String _namaProv = "DKI JAKARTA";
  final controller = ScrollController();
  double offset = 0;

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
                  offset: offset,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
                              .map<DropdownMenuItem<String>>((String value) {
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value),
                              );
                          }).toList(),
                          //onChanged: (value) {},
                          onChanged: (String? newValue){
                            setState(() {
                              _namaProv = newValue!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
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
                        Container(
                          padding: const EdgeInsets.all(20),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const <Widget>[
                              Counter(
                                color: kInfectedColor,
                                number: 1046,
                                title: "Positif",
                              ),
                              Counter(
                                color: kRecovercolor,
                                number: 46,
                                title: "Sembuh",
                              ),
                              Counter(
                                color: kDeathColor,
                                number: 400,
                                title: "Meninggal",
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
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
                                'fKELURAHAN SEHAT TERUS',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        const SizedBox(height: 20),
                        Container(
                          padding: const EdgeInsets.all(20),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const <Widget>[
                              Counter(
                                color: kInfectedColor,
                                number: 1046,
                                title: "Positif",
                              ),
                              Counter(
                                color: kRecovercolor,
                                number: 46,
                                title: "Sembuh",
                              ),
                              Counter(
                                color: kDeathColor,
                                number: 500,
                                title: "Meninggal",
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const <Widget>[
                            Text(
                              "Sebaran Kasus",
                              style: kTitleTextstyle,
                            ),
                          ],
                        ),
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

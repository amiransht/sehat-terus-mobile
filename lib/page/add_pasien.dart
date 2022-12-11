import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:sehat_terus/page/show_pasien.dart';

class PasienForm extends StatefulWidget {
  const PasienForm({super.key});

  @override
  State<PasienForm> createState() => _PasienFormState();
}

class _PasienFormState extends State<PasienForm> {
  final _formKey = GlobalKey<FormState>();
  String _nama = '';
  int _umur = 0;
  String _alamat = '';
  List<String> jenisKelamin = ['Laki-laki', 'Perempuan'];
  String _jenisKelamin = 'Laki-laki';
  List<String> gejala = ['Ada', 'Tidak Ada'];
  String _gejala = 'Ada';

  var _controllerNama = TextEditingController();
  var _controllerUmur = TextEditingController();
  var _controllerAlamat = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Pasien'),
      ),
      // Menambahkan drawer menu
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
            child: Container(
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Nama",
                    labelText: "Nama",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _nama = value!;
                    });
                  },
                  onSaved: (String? value) {
                    setState(() {
                      _nama = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Nama tidak boleh kosong!';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Umur",
                    labelText: "Umur",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _umur = int.parse(value!);
                    });
                  },
                  onSaved: (String? value) {
                    setState(() {
                      _umur = int.parse(value!);
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Umur tidak boleh kosong!';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: "Alamat",
                    labelText: "Alamat",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      _alamat = value!;
                    });
                  },
                  onSaved: (String? value) {
                    setState(() {
                      _alamat = value!;
                    });
                  },
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Alamat tidak boleh kosong!';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Jenis Kelamin:"),
                    DropdownButtonFormField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 12),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16))),
                      hint: const Text("Jenis Kelamin"),
                      value: _jenisKelamin,
                      validator: (value) =>
                          value == null ? "Jenis Kelamin" : null,
                      items: const <DropdownMenuItem<String>>[
                        DropdownMenuItem<String>(
                          value: 'Laki-laki',
                          child: Text('Laki-laki'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'Perempuan',
                          child: Text('Perempuan'),
                        ),
                      ],
                      onChanged: (String? value) {
                        setState(() {
                          _jenisKelamin = value!;
                        });
                      },
                    ), // <-- SEE HERE
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Gejala:"),
                    DropdownButtonFormField(
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 12, horizontal: 12),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16))),
                      hint: const Text("Gejala"),
                      value: _gejala,
                      validator: (value) => value == null ? "Gejala" : null,
                      items: const <DropdownMenuItem<String>>[
                        DropdownMenuItem<String>(
                          value: 'Ada',
                          child: Text('Ada'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'Tidak Ada',
                          child: Text('Tidak Ada'),
                        ),
                      ],
                      onChanged: (String? value) {
                        setState(() {
                          _gejala = value!;
                        });
                      },
                    ), // <-- SEE HER
                  ],
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.bottomCenter,
                child: TextButton(
                  child: const Text(
                    "Simpan",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      var data = convert.jsonEncode(
                        <String, String?>{
                          'nama': _nama,
                          'umur': _umur.toString(),
                          'alamat': _alamat,
                          'jenisKelamin': _jenisKelamin,
                          'gejala': _gejala,
                        },
                      );

                      final response = await request.postJson(
                          "https://sehat-terus.up.railway.app/lurah-page/add-flutter/",
                          data);

                      if (response['status'] == 'success') {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text("Patient has been added!"),
                        ));
                        Navigator.pushReplacementNamed(context, '/showpasien');
                      }
                    }
                  },
                ),
              ),
            ],
          ),
        )),
      ),
    );
  }
}

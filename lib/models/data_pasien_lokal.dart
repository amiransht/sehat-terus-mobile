// To parse this JSON data, do
//
//     final dataPasienLokal = dataPasienLokalFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

List<DataPasienLokal> dataPasienLokalFromJson(String str) => List<DataPasienLokal>.from(json.decode(str).map((x) => DataPasienLokal.fromJson(x)));

String dataPasienLokalToJson(List<DataPasienLokal> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DataPasienLokal {
    DataPasienLokal({
        required this.model,
        required this.pk,
        required this.fields,
    });

    String model;
    int pk;
    Fields fields;

    factory DataPasienLokal.fromJson(Map<String, dynamic> json) => DataPasienLokal(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    Fields({
        required this.user,
        required this.nama,
        required this.umur,
        required this.gender,
        required this.gejala,
        required this.alamat,
        required this.isCovid,
    });

    int user;
    String nama;
    int umur;
    String gender;
    String gejala;
    String alamat;
    bool isCovid;

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        nama: json["nama"],
        umur: json["umur"],
        gender: json["gender"],
        gejala: json["gejala"],
        alamat: json["alamat"],
        isCovid: json["is_covid"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "nama": nama,
        "umur": umur,
        "gender": gender,
        "gejala": gejala,
        "alamat": alamat,
        "is_covid": isCovid,
    };
}


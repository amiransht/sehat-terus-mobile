class Pasien {
  String? model;
  int? pk;
  Fields? fields;

  Pasien({this.model, this.pk, this.fields});

  Pasien.fromJson(Map<String, dynamic> json) {
    model = json['model'];
    pk = json['pk'];
    fields =
        json['fields'] != null ? new Fields.fromJson(json['fields']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['model'] = this.model;
    data['pk'] = this.pk;
    if (this.fields != null) {
      data['fields'] = this.fields!.toJson();
    }
    return data;
  }
}

class Fields {
  int? user;
  String? nama;
  int? umur;
  String? gender;
  String? gejala;
  String? alamat;
  bool? isCovid;

  Fields(
      {this.user,
      this.nama,
      this.umur,
      this.gender,
      this.gejala,
      this.alamat,
      this.isCovid});

  Fields.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    nama = json['nama'];
    umur = json['umur'];
    gender = json['gender'];
    gejala = json['gejala'];
    alamat = json['alamat'];
    isCovid = json['is_covid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user'] = this.user;
    data['nama'] = this.nama;
    data['umur'] = this.umur;
    data['gender'] = this.gender;
    data['gejala'] = this.gejala;
    data['alamat'] = this.alamat;
    data['is_covid'] = this.isCovid;
    return data;
  }
}

class DataCovid {
  List<ListData>? listData;

  DataCovid({this.listData});

  DataCovid.fromJson(Map<String, dynamic> json) {
    if (json['list_data'] != null) {
      listData = <ListData>[];
      json['list_data'].forEach((v) {
        listData!.add(new ListData.fromJson(v));
      });

    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.listData != null) {
      data['list_data'] = this.listData!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class ListData {
  String? key;
  int? jumlahKasus;
  int? jumlahSembuh;
  int? jumlahMeninggal;

  ListData(
      {this.key, this.jumlahKasus, this.jumlahSembuh, this.jumlahMeninggal});

  ListData.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    jumlahKasus = json['jumlah_kasus'];
    jumlahSembuh = json['jumlah_sembuh'];
    jumlahMeninggal = json['jumlah_meninggal'];
  }


  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['jumlah_kasus'] = this.jumlahKasus;
    data['jumlah_sembuh'] = this.jumlahSembuh;
    data['jumlah_meninggal'] = this.jumlahMeninggal;

    return data;
  }
}

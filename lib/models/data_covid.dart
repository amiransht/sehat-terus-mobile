

class DataCovidIndo {
  String? key;
  int? jumlahKasus;
  int? jumlahSembuh;
  int? jumlahMeninggal;

  DataCovidIndo(
      {this.key, this.jumlahKasus, this.jumlahSembuh, this.jumlahMeninggal});

  DataCovidIndo.fromJson(Map<String, dynamic> json) {
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

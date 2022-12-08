import 'package:equatable/equatable.dart';

class Article extends Equatable {
  final String id;
  final String title;
  final String body;
  final String author;
  final String source;
  final String image;
  final int views;
  final String createdAt;

  const Article(
      {required this.id,
      required this.title,
      required this.body,
      required this.author,
      required this.source,
      required this.image,
      required this.views,
      required this.createdAt});

  static List<Article> articles = [
    const Article(
      id: '1',
      title:
          'DKI Catat 1.056 Kasus, Ini Sebaran 2.548 Kasus Baru COVID-19 RI 4 Desember',
      body:
          'Indonesia mencatat sebanyak 2.548 kasus baru COVID-19, Minggu (4/12/2022). Kasus aktif kini sebanyak 50.987 kasus. DKI Jakarta kini menyumbang jumlah kasus terbanyak dengan total 1.056. Disusul oleh Jawa Barat dengan total 499 kasus, kemudian Banten dengan total 278 kasus.Detail perkembangan virus Corona, Minggu (4/12)\nPasien positif bertambah 2.548 menjadi 6.680.203\nPasien sembuh bertambah 5.772 menjadi 6.469.238\nPasien meninggal bertambah 25 menjadi 159.978',
          
      author: 'Hana Nushratu',
      source: 'detikHealth',
      views: 1204,
      image: 'assets/news2.jpeg',
      createdAt: '04 Des 2022',
    ),
    const Article(
      id: '2',
      title:
          'Simak 5 Gejala COVID-19 Varian Terbaru, Mirip Flu!',
      body:
          'Seiring virus Corona masih terus bermutasi, gejala COVID-19 menjadi sorotan. Dan Indonesia kembali dibayangi kasus COVID-19. Apalagi varian-varian baru Corona memicu gejala yang mirip dengan batuk-pilek biasa. Varian baru COVID-19 ini memiliki gejala ringan dan beragam. Sehingga sering disebut mirip dengan gejala flu biasa. Ketua departemen pulmonologi dan kedokteran respirasi Fakultas Kedokteran Universitas Indonesia (FKUI), dr Prasenohadi, PhD, SpP(K), KIC mengatakan untuk melihat perbedaannya perlu tes PCR atau antigen',
      author: 'Nurul Febian Darari',
      source: 'detikJatim',
      views: 1204,
      image: 'assets/news3.jpeg',
      createdAt: '04 Des 2022',
    ),
    const Article(
      id: '3',
      title:
          'Kemenkes Ungkap RI Masih Level 1 Transmisi Komunitas COVID-19',
      body:
          'Menyusul kenaikan kasus COVID-19 RI imbas subvarian Omicron XBB, Kementerian Kesehatan RI menyebut Indonesia kini masih berada di Level 1 transmisi komunitas. Namun memang ditemukan dalam sepekan terakhir, tren kasus COVID-19 di Indonesia mengalami penurunan, dibarengi penurunan kasus rawat inap di rumah sakit. "Dalam tujuh hari terakhir rata-rata 5.025 dan hari kemarin 1 desember 4.977, terjadi penurunan 21,2 persen." ungkap juru bicara Kemenkes RI dr Mohammad Syahril melalui keterangan resminya, Sabtu (3/12/2022).',
      author: 'Vidya Pinandhita',
      source: 'detikHealth',
      views: 1204,
      image: 'assets/news4.jpeg',
      createdAt: '03 Des 2022',
    ),
    const Article(
      id: '4',
      title: 'Bisa Lolos Pemeriksaan Antigen, Seberapa Bahaya Sih COVID Varian XBB?',
      body:
          'COVID-19 varian Omicron XBB diketahui telah masuk ke Indonesia. Varian anyar ini disinyalir menjadi pemicu naiknya kasus COVID-19 di Tanah Air. Berdasarkan keterangan Kementerian Kesehatan RI, Meski gejalanya relatif lebih ringan dibandingkan subvarian Omicron BA.4 dan BA,5, Omicron XBB memiliki kemampuan menular lebih cepat dibandingkan varian-varian Corona lainnya. Varian baru COVID-19 itu juga memiliki kemampuan untuk menghindar dari antibodi yang ada pada tubuh, termasuk antibodi karena vaksin. Di samping itu, Departemen Kesehatan Filipina menyebut Omicron XBB berpotensi tidak terdeteksi dalam pengujian antigen. Sehingga, butuh tes RT-PCR untuk mendeteksi COVID-19 varian baru tersebut.',
      author: 'Yudistira Perdana Imandiar',
      source: 'detikHealth',
      views: 1204,
      image: 'assets/news5.png',
      createdAt: '02 Des 2022',
    ),
    const Article(
      id: '5',
      title:
          'Aksi Solidaritas di Tokyo Tolak Lockdown China',
      body:
          'Sejumlah warga China yang tinggal di Jepang menggelar aksi protes terhadap lockdown China. Mereka membawa kertas kosong dan sejumlah poster lainnya. Sejumlah warga China yang tinggal di Jepang bergabung dengan para demonstran dalam aksi protes solidaritas menentang penguncian COVID-19 China, di Tokyo, Jepang, Rabu (30/11).',
      author: 'Kim Kyung-Hoon',
      source: 'detikNews',
      views: 1204,
      image: 'assets/news6.jpeg',
      createdAt: '01 Des 2022',
    ),
  ];

  @override
  List<Object?> get props => [
        id,
        title,
        body,
        author,
        source,
        image,
        createdAt,
      ];
}

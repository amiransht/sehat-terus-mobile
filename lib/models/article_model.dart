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
          'Indonesia mencatat sebanyak 2.548 kasus baru COVID-19, Minggu (4/12/2022). Kasus aktif kini sebanyak 50.987 kasus. DKI Jakarta kini menyumbang jumlah kasus terbanyak dengan total 1.056. Disusul oleh Jawa Barat dengan total 499 kasus, kemudian Banten dengan total 278 kasus.',
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
          'Aliquam ullamcorper ipsum, vel consequat sem finibus a. Donec lobortis',
      body:
          'Nullam sed augue a turpis bibendum cursus. Suspendisse potenti. Praesent mi ligula, mollis quis elit ac, eleifend vestibulum ex. Nullam quis sodales tellus. Integer feugiat dolor et nisi semper luctus. Nulla egestas nec augue facilisis pharetra. Sed ultricies nibh a odio aliquam, eu imperdiet purus aliquam. Donec id ante nec',
      author: 'Anna G. Wright',
      source: 'Politics',
      views: 1204,
      image: 'assets/news1.png',
      createdAt: 'Minggu, 04 Desember 2022',
    ),
    const Article(
      id: '4',
      title: 'Proin mattis nec lorem at rutrum. Curabitur sit augue vel',
      body:
          'Nullam sed augue a turpis bibendum cursus. Suspendisse potenti. Praesent mi ligula, mollis quis elit ac, eleifend vestibulum ex. Nullam quis sodales tellus. Integer feugiat dolor et nisi semper luctus. Nulla egestas nec augue facilisis pharetra. Sed ultricies nibh a odio aliquam, eu imperdiet purus aliquam. Donec id ante nec',
      author: 'Anna G. Wright',
      source: 'Politics',
      views: 1204,
      image: 'assets/news1.png',
      createdAt: 'Minggu, 04 Desember 2022',
    ),
    const Article(
      id: '5',
      title:
          'Donec lobortis lectus a iaculis rutrum. Vestibulum libero sit amet',
      body:
          'Nullam sed augue a turpis bibendum cursus. Suspendisse potenti. Praesent mi ligula, mollis quis elit ac, eleifend vestibulum ex. Nullam quis sodales tellus. Integer feugiat dolor et nisi semper luctus. Nulla egestas nec augue facilisis pharetra. Sed ultricies nibh a odio aliquam, eu imperdiet purus aliquam. Donec id ante nec',
      author: 'Anna G. Wright',
      source: 'Politics',
      views: 1204,
      image: 'assets/news1.png',
      createdAt: 'Minggu, 04 Desember 2022',
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

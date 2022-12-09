import 'package:flutter/material.dart';

import 'package:sehat_terus/page/blog_page.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:sehat_terus/page/accordion.dart';
import 'package:provider/provider.dart';
import 'package:sehat_terus/page/formBlog_page.dart';

import '../core/colors.dart';

class FaqPage extends StatelessWidget {
  const FaqPage({Key? key}) : super(key: key);
  static const routeName = '/faq';

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: BaseColors.green,
        centerTitle: true,
        title: const Text(
          'Tanya Jawab COVID-19',
        ),
      ),
      body: ListView(children: [
        Accordion(
            title:
                'Mengapa saya masih harus menerapkan protokol kesehatan (3M), padahal saya sudah divaksinasi?',
            content:
                'Perlindungan optimal baru terbangun dua pekan setelah vaksinasi dosis kedua. Walaupun jarang terjadi, masih ada orang yang tertular COVID-19 meskipun telah divaksinasi. Akan tetapi, gejala COVID-19 pada orang yang sudah divaksinasi umumnya ringan. Sebagian orang bahkan tidak mengalami gejala apa pun. Penting untuk dipahami bahwa orang tanpa gejala (OTG) masih dapat menulari orang lain tanpa disadari. Oleh karena itu kita harus tetap menggunakan masker, menjaga jarak aman, dan rajin mencuci tangan pakai sabun.'),
        Accordion(
            title: 'Kapan saya perlu menemui tenaga kesehatan?',
            content:
                'Jika demam timbul lebih dari 48 jam setelah vaksinasi, atau berlangsung lebih lama dari 48 jam, Anda harus isolasi mandiri dan melakukan tes COVID-19. Jika keluhan tidak berkurang, penting untuk tetap tenang dan segera menghubungi petugas kesehatan di nomor kontak yang tertera di kartu vaksinasi Anda.'),
        Accordion(
            title:
                'Apa yang harus saya lakukan jika saya memiliki gejala COVID-19 dan kapan saya harus mencari pertolongan medis?',
            content:
                'Jika Anda mengalami gejala ringan, seperti batuk ringan atau demam ringan, secara umum tidak perlu mencari pertolongan medis. Tetap di rumah, isolasi diri, dan pantau gejala Anda. Ikuti panduan nasional tentang isolasi mandiri. Namun, jika Anda tinggal di daerah dengan malaria atau demam berdarah, Anda tidak boleh mengabaikan gejala demam. Segera cari pertolongan medis. Saat Anda pergi ke fasilitas kesehatan, kenakan masker jika memungkinkan, jaga jarak setidaknya 1 meter dari orang lain, dan jangan menyentuh permukaan benda dengan tangan Anda. Jika yang sakit adalah anak, bantu anak untuk mematuhi nasihat ini. Segera cari perawatan medis jika Anda mengalami kesulitan bernapas atau nyeri/tekanan di dada. Jika memungkinkan, hubungi penyedia layanan kesehatan Anda terlebih dahulu, sehingga Anda dapat diarahkan ke fasilitas kesehatan yang tepat.'),
        Accordion(
            title:
                'Apa yang dapat saya lakukan untuk melindungi diri saya dan orang lain jika tidak mengetahui siapa yang terinfeksi COVID-19?',
            content:
                'Mempraktikkan kebersihan tangan dan pernapasan setiap saat sangatlah penting, dan merupakan cara terbaik untuk melindungi orang lain dan diri Anda sendiri. Apabila memungkinkan, jaga jarak Anda dengan orang lain minimal 1 meter terutama jika berada di dekat orang yang batuk atau bersin. Karena beberapa orang yang terinfeksi mungkin belum menunjukkan gejala atau gejalanya masih ringan, menjaga jarak fisik dengan semua orang adalah upaya terbaik jika Anda berada di daerah di mana COVID-19 menyebar.'),
        Accordion(
            title:
                'Apa yang sebaiknya saya lakukan jika saya berkontak erat dengan seseorang yang terinfeksi COVID-19?',
            content:
                'Jika Anda telah berkontak erat dengan seseorang yang terinfeksi COVID-19 maka Anda kemungkinan akan terinfeksi. Kontak erat berarti tinggal atau berada dalam jarak kurang dari 1 meter dari orang yang terinfeksi COVID-19. Jika demikian, sangat disarankan untuk tidak meninggalkan rumah. Namun, jika Anda tinggal di daerah di mana terdapat kasus malaria atau demam berdarah, maka penting untuk tidak mengabaikan gejala demam. Segera cari pertolongan medis.  Saat Anda pergi ke fasilitas kesehatan, kenakan masker jika memungkinkan, jaga jarak setidaknya 1 meter dari orang lain, dan jangan menyentuh permukaan dengan tangan Anda. Jika yang sakit adalah anak, bantu anak untuk mematuhi nasihat ini. Jika Anda terinfeksi COVID-19 (telah dikonfirmasi dengan tes), lakukan isolasi mandiri selama 14 hari bahkan setelah gejala menghilang sebagai tindakan pencegahan, meskipun belum diketahui secara pasti berapa lama pasien masih dapat menularkan setelah dinyatakan sembuh. Ikuti pedoman nasional tentang isolasi mandiri.'),
        Accordion(
            title:
                'Apa perbedaan antara isolasi mandiri, karantina mandiri, dan menjaga jarak fisik?',
            content:
                'Karantina berarti membatasi kegiatan atau memisahkan orang yang tidak sakit tetapi mungkin terpajan COVID-19. Tujuannya adalah untuk mencegah penyebaran penyakit pada saat orang tersebut baru mulai mengalami gejala. Isolasi berarti memisahkan orang yang sakit dengan gejala COVID-19 dan mungkin menular guna mencegah penularan. Menjaga jarak fisik berarti terpisah secara fisik. WHO merekomendasikan untuk menjaga jarak setidaknya 1 meter dari orang lain. Jarak ini merupakan ukuran umum tentang seberapa jauh semua orang harus saling menjaga jarak walaupun mereka baik-baik saja tanpa diketahui terpajan COVID-19 atau tidak.'),
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: BaseColors.green,
            // minimumSize: const Size.fromHeight(40),
          ),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => BlogPage()));
          },
          child: const Text(
            'Lihat Blog',
            style: TextStyle(fontSize: 12, color: Colors.white),
          ),
        ),
        SizedBox(
          width: 200.0,
          height: 30.0,
        ),
        TextButton(
          style: TextButton.styleFrom(
            backgroundColor: BaseColors.green,
            // minimumSize: const Size.fromHeight(40),
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => BlogFormPage()));
          },
          child: const Text(
            'Buat Blog',
            style: TextStyle(fontSize: 12, color: Colors.white),
          ),
        ),
      ]),
    );
  }
}

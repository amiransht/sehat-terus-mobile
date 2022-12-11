import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';
import 'package:sehat_terus/appbar.dart';
import 'package:sehat_terus/core/colors.dart';
import 'package:sehat_terus/page/main_page.dart';
import 'package:sehat_terus/page/formBlog_page.dart';
import 'package:sehat_terus/widget/title.dart';
import 'package:sehat_terus/models/user_profile.dart';

class FaqPage extends StatelessWidget {
  final User? user;
  const FaqPage({Key? key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    // final isNakes = ModalRoute.of(context)!.settings.arguments;
    print("faq: isnakes?");
    print(user?.isNakes);

    return Scaffold(
        extendBody: true,
        appBar: buildAppBar(context, "FAQ", user),
        body: SingleChildScrollView(
            child: Column(children: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Column(children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: TitleHeader(textTop: "Paling Sering Ditanya"),
                ),
                GFAccordion(
                  collapsedIcon: Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: BaseColors.green,
                    size: 30,
                  ),
                  expandedIcon: Icon(
                    Icons.keyboard_arrow_up_outlined,
                    color: BaseColors.green,
                    size: 30,
                  ),
                  expandedTitleBackgroundColor:
                      Color.fromARGB(255, 146, 223, 234).withOpacity(0.4),
                  textStyle: TextStyle(fontSize: 13),
                  title:
                      'Mengapa saya masih harus menerapkan protokol kesehatan (3M), padahal saya sudah divaksinasi?',
                  titleBorderRadius: BorderRadius.circular(25),
                  titleBorder: Border.all(color: Color(0xFFE5E5E5)),
                  titlePadding:
                      EdgeInsets.only(left: 20, top: 20, bottom: 20, right: 10),
                  content:
                      'Perlindungan optimal baru terbangun dua pekan setelah vaksinasi dosis kedua. Walaupun jarang terjadi, masih ada orang yang tertular COVID-19 meskipun telah divaksinasi. Akan tetapi, gejala COVID-19 pada orang yang sudah divaksinasi umumnya ringan. Sebagian orang bahkan tidak mengalami gejala apa pun. Penting untuk dipahami bahwa orang tanpa gejala (OTG) masih dapat menulari orang lain tanpa disadari. Oleh karena itu kita harus tetap menggunakan masker, menjaga jarak aman, dan rajin mencuci tangan pakai sabun.',
                  contentPadding:
                      EdgeInsets.only(left: 20, top: 20, bottom: 20, right: 10),
                  contentBorderRadius: BorderRadius.circular(25),
                ),
                GFAccordion(
                  collapsedIcon: Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: BaseColors.green,
                    size: 30,
                  ),
                  expandedIcon: Icon(
                    Icons.keyboard_arrow_up_outlined,
                    color: BaseColors.green,
                    size: 30,
                  ),
                  expandedTitleBackgroundColor:
                      Color.fromARGB(255, 146, 223, 234).withOpacity(0.4),
                  textStyle: TextStyle(fontSize: 13),
                  title: 'Kapan saya perlu menemui tenaga kesehatan?',
                  titleBorderRadius: BorderRadius.circular(25),
                  titleBorder: Border.all(color: Color(0xFFE5E5E5)),
                  titlePadding:
                      EdgeInsets.only(left: 20, top: 20, bottom: 20, right: 10),
                  content:
                      'Jika demam timbul lebih dari 48 jam setelah vaksinasi, atau berlangsung lebih lama dari 48 jam, Anda harus isolasi mandiri dan melakukan tes COVID-19. Jika keluhan tidak berkurang, penting untuk tetap tenang dan segera menghubungi petugas kesehatan di nomor kontak yang tertera di kartu vaksinasi Anda.',
                  contentPadding:
                      EdgeInsets.only(left: 20, top: 20, bottom: 20, right: 10),
                  contentBorderRadius: BorderRadius.circular(25),
                ),
                GFAccordion(
                  collapsedIcon: Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: BaseColors.green,
                    size: 30,
                  ),
                  expandedIcon: Icon(
                    Icons.keyboard_arrow_up_outlined,
                    color: BaseColors.green,
                    size: 30,
                  ),
                  expandedTitleBackgroundColor:
                      Color.fromARGB(255, 146, 223, 234).withOpacity(0.4),
                  textStyle: TextStyle(fontSize: 13),
                  title:
                      'Apa yang harus saya lakukan jika saya memiliki gejala COVID-19 dan kapan saya harus mencari pertolongan medis?',
                  titleBorderRadius: BorderRadius.circular(25),
                  titleBorder: Border.all(color: Color(0xFFE5E5E5)),
                  titlePadding:
                      EdgeInsets.only(left: 20, top: 20, bottom: 20, right: 10),
                  content:
                      'Jika Anda mengalami gejala ringan, seperti batuk ringan atau demam ringan, secara umum tidak perlu mencari pertolongan medis. Tetap di rumah, isolasi diri, dan pantau gejala Anda. Ikuti panduan nasional tentang isolasi mandiri. Namun, jika Anda tinggal di daerah dengan malaria atau demam berdarah, Anda tidak boleh mengabaikan gejala demam. Segera cari pertolongan medis. Saat Anda pergi ke fasilitas kesehatan, kenakan masker jika memungkinkan, jaga jarak setidaknya 1 meter dari orang lain, dan jangan menyentuh permukaan benda dengan tangan Anda. Jika yang sakit adalah anak, bantu anak untuk mematuhi nasihat ini. Segera cari perawatan medis jika Anda mengalami kesulitan bernapas atau nyeri/tekanan di dada. Jika memungkinkan, hubungi penyedia layanan kesehatan Anda terlebih dahulu, sehingga Anda dapat diarahkan ke fasilitas kesehatan yang tepat.',
                  contentPadding:
                      EdgeInsets.only(left: 20, top: 20, bottom: 20, right: 10),
                  contentBorderRadius: BorderRadius.circular(25),
                ),
                GFAccordion(
                  collapsedIcon: Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: BaseColors.green,
                    size: 30,
                  ),
                  expandedIcon: Icon(
                    Icons.keyboard_arrow_up_outlined,
                    color: BaseColors.green,
                    size: 30,
                  ),
                  expandedTitleBackgroundColor:
                      Color.fromARGB(255, 146, 223, 234).withOpacity(0.4),
                  textStyle: TextStyle(fontSize: 13),
                  title:
                      'Apa yang dapat saya lakukan untuk melindungi diri saya dan orang lain jika tidak mengetahui siapa yang terinfeksi COVID-19?',
                  titleBorderRadius: BorderRadius.circular(25),
                  titleBorder: Border.all(color: Color(0xFFE5E5E5)),
                  titlePadding:
                      EdgeInsets.only(left: 20, top: 20, bottom: 20, right: 10),
                  content:
                      'Mempraktikkan kebersihan tangan dan pernapasan setiap saat sangatlah penting, dan merupakan cara terbaik untuk melindungi orang lain dan diri Anda sendiri. Apabila memungkinkan, jaga jarak Anda dengan orang lain minimal 1 meter terutama jika berada di dekat orang yang batuk atau bersin. Karena beberapa orang yang terinfeksi mungkin belum menunjukkan gejala atau gejalanya masih ringan, menjaga jarak fisik dengan semua orang adalah upaya terbaik jika Anda berada di daerah di mana COVID-19 menyebar.',
                  contentPadding:
                      EdgeInsets.only(left: 20, top: 20, bottom: 20, right: 10),
                  contentBorderRadius: BorderRadius.circular(25),
                ),
                GFAccordion(
                  collapsedIcon: Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: BaseColors.green,
                    size: 30,
                  ),
                  expandedIcon: Icon(
                    Icons.keyboard_arrow_up_outlined,
                    color: BaseColors.green,
                    size: 30,
                  ),
                  expandedTitleBackgroundColor:
                      Color.fromARGB(255, 146, 223, 234).withOpacity(0.4),
                  textStyle: TextStyle(fontSize: 13),
                  title:
                      'Apa yang sebaiknya saya lakukan jika saya berkontak erat dengan seseorang yang terinfeksi COVID-19?',
                  titleBorderRadius: BorderRadius.circular(25),
                  titleBorder: Border.all(color: Color(0xFFE5E5E5)),
                  titlePadding:
                      EdgeInsets.only(left: 20, top: 20, bottom: 20, right: 10),
                  content:
                      'Jika Anda telah berkontak erat dengan seseorang yang terinfeksi COVID-19 maka Anda kemungkinan akan terinfeksi. Kontak erat berarti tinggal atau berada dalam jarak kurang dari 1 meter dari orang yang terinfeksi COVID-19. Jika demikian, sangat disarankan untuk tidak meninggalkan rumah. Namun, jika Anda tinggal di daerah di mana terdapat kasus malaria atau demam berdarah, maka penting untuk tidak mengabaikan gejala demam. Segera cari pertolongan medis.  Saat Anda pergi ke fasilitas kesehatan, kenakan masker jika memungkinkan, jaga jarak setidaknya 1 meter dari orang lain, dan jangan menyentuh permukaan dengan tangan Anda. Jika yang sakit adalah anak, bantu anak untuk mematuhi nasihat ini. Jika Anda terinfeksi COVID-19 (telah dikonfirmasi dengan tes), lakukan isolasi mandiri selama 14 hari bahkan setelah gejala menghilang sebagai tindakan pencegahan, meskipun belum diketahui secara pasti berapa lama pasien masih dapat menularkan setelah dinyatakan sembuh. Ikuti pedoman nasional tentang isolasi mandiri.',
                  contentPadding:
                      EdgeInsets.only(left: 20, top: 20, bottom: 20, right: 10),
                  contentBorderRadius: BorderRadius.circular(25),
                ),
                GFAccordion(
                  collapsedIcon: Icon(
                    Icons.keyboard_arrow_down_outlined,
                    color: BaseColors.green,
                    size: 30,
                  ),
                  expandedIcon: Icon(
                    Icons.keyboard_arrow_up_outlined,
                    color: BaseColors.green,
                    size: 30,
                  ),
                  expandedTitleBackgroundColor:
                      Color.fromARGB(255, 146, 223, 234).withOpacity(0.4),
                  textStyle: TextStyle(fontSize: 13),
                  title:
                      'Apa perbedaan antara isolasi mandiri, karantina mandiri, dan menjaga jarak fisik?',
                  titleBorderRadius: BorderRadius.circular(25),
                  titleBorder: Border.all(color: Color(0xFFE5E5E5)),
                  titlePadding:
                      EdgeInsets.only(left: 20, top: 20, bottom: 20, right: 10),
                  content:
                      'Karantina berarti membatasi kegiatan atau memisahkan orang yang tidak sakit tetapi mungkin terpajan COVID-19. Tujuannya adalah untuk mencegah penyebaran penyakit pada saat orang tersebut baru mulai mengalami gejala. Isolasi berarti memisahkan orang yang sakit dengan gejala COVID-19 dan mungkin menular guna mencegah penularan. Menjaga jarak fisik berarti terpisah secara fisik. WHO merekomendasikan untuk menjaga jarak setidaknya 1 meter dari orang lain. Jarak ini merupakan ukuran umum tentang seberapa jauh semua orang harus saling menjaga jarak walaupun mereka baik-baik saja tanpa diketahui terpajan COVID-19 atau tidak.',
                  contentPadding:
                      EdgeInsets.only(left: 20, top: 20, bottom: 20, right: 10),
                  contentBorderRadius: BorderRadius.circular(25),
                ),
              ])),
          Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 25,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Ada Pertanyaan?",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: BaseColors.green,
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Text(
                        "Cari tahu informasi seputar\nCovid-19 melalui blog kami!.\n\n",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                      Row(
                        children: [
                          GFButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MainPage(
                                    setPageAtIndex: 2, userLoggedIn: user,
                                  ),
                                ),
                              );
                            },
                            text: "Lihat Blog",
                            size: GFSize.SMALL,
                            type: GFButtonType.outline,
                            shape: GFButtonShape.pills,
                            color: BaseColors.black,
                            splashColor: BaseColors.green,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 0),
                          ),
                          SizedBox(
                            width: 8.0,
                          ),
                          GFButton(
                            onPressed: () {
                              if (request.loggedIn && user!.isNakes ) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BlogFormPage(
                                      user: user,
                                    ),
                                  ),
                                );
                                
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Login sebagai Nakes!'),
                                    backgroundColor: Colors.teal,
                                    behavior: SnackBarBehavior.floating,
                                  ),
                                );
                              }
                            },
                            text: "Buat Blog",
                            size: GFSize.SMALL,
                            type: GFButtonType.outline,
                            shape: GFButtonShape.pills,
                            color: BaseColors.black,
                            splashColor: BaseColors.green,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 0),
                          ),
                        ],
                      )
                    ],
                  ),
                  Image.asset(
                    "assets/img-faq.png",
                    height: 120,
                    fit: BoxFit.fill,
                  ),
                ],
              )),
        ])));
  }
}

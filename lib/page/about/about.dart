import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:sehat_terus/appbar.dart';
import 'package:sehat_terus/core/colors.dart';
import 'package:sehat_terus/page/faq%20and%20blog/faq_page.dart';
import 'package:stroke_text/stroke_text.dart';
import 'package:sehat_terus/models/user_profile.dart';

class AboutPage extends StatefulWidget {
  final User? user;
  const AboutPage({Key? key, this.user}) : super(key: key);

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, "Tentang Aplikasi", widget.user),
      extendBody: true,
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "WUJUDKAN INDONESIA",
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 30),
                ),
                const SizedBox(
                  height: 10,
                ),
                Image.asset(
                  "assets/about-2.png",
                  width: 350,
                  fit: BoxFit.cover,
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                    padding: const EdgeInsets.all(15),
                    child: Image.asset("assets/about.png"))
              ],
            ),
          ),
          Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 10,
              ),
              child: const Text(
                "     SehatTerus merupakan aplikasi yang dikembangkan untuk membantu warga dalam mengetahui perkembangan penyebaran virus COVID-19 di Indonesia. Masyarakat umum dapat menggunakan SehatTerus untuk melihat statistik pasien COVID-19 di Indonesia dan provinsi, membaca berita terkini, sekaligus melihat tanya jawab dan blog seputar COVID-19. \n\n    Selain itu, aplikasi ini juga ditujukan untuk memungkinkan para tenaga kesehatan melakukan tracking secara digital terhadap pasien COVID-19 yang masih membutuhkan bantuan, serta memungkinkan Lurah untuk dapat mendata setiap warga yang terinfeksi oleh virus Covid-19 di Kelurahan Terus Sehat.",
                textAlign: TextAlign.justify,
                style: TextStyle(),
              )),
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
                        "Cari tahu pertanyaan yang sering \nmuncul mengenai COVID-19.\n\n",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                      GFButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FaqPage(
                                user: widget.user,
                              ),
                            ),
                          );
                        },
                        text: "Lihat FAQ",
                        size: GFSize.SMALL,
                        type: GFButtonType.outline,
                        shape: GFButtonShape.pills,
                        color: BaseColors.black,
                        splashColor: BaseColors.green,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 0),
                      ),
                    ],
                  ),
                  Image.asset(
                    "assets/img-faq.png",
                    height: 120,
                    fit: BoxFit.fill,
                  ),
                ],
              )),
          const SizedBox(
            height: 20,
          ),
        ],
      )),
    );
  }
}

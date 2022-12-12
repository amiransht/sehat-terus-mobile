import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sehat_terus/models/user_profile.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:sehat_terus/page/authentication/login_pageui.dart';
import 'package:sehat_terus/page/main_page.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../config.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class ProfileScreen extends StatefulWidget {
  final User? user;
  const ProfileScreen({Key? key, this.user}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();

    if (!request.loggedIn) {
      return LoginApp();
    } else {
      var args = widget.user;
      double width = MediaQuery.of(context).size.width;
      double height = MediaQuery.of(context).size.height;
      return Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 66, 114, 121),
                  Color.fromARGB(255, 127, 221, 213),
                ],
                begin: FractionalOffset.bottomCenter,
                end: FractionalOffset.topCenter,
              ),
            ),
          ),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 73),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          AntDesign.arrowleft,
                          color: Colors.white,
                        ),
                        Row(
                          children: [
                            Text(
                              'Logout',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontFamily: 'Nisebuschgardens',
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              child: Icon(
                                AntDesign.logout,
                                color: Colors.white,
                              ),
                              onTap: () async {
                                await request.logout(
                                    "${AppConfig.apiUrl}authentication/logout_flutter/");
                                Navigator.pushReplacementNamed(
                                    context, '/main');
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Informasi\nLogin',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 34,
                        fontFamily: 'Nisebuschgardens',
                      ),
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    Container(
                      height: height * 0.43,
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          double innerHeight = constraints.maxHeight;
                          double innerWidth = constraints.maxWidth;
                          return Stack(
                            fit: StackFit.expand,
                            children: [
                              Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Container(
                                  height: innerHeight * 0.72,
                                  width: innerWidth,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 80,
                                      ),
                                      Text(
                                        // 'coba coba ',
                                        '${args!.firstName} ${args.lastName}',
                                        style: TextStyle(
                                          color:
                                              Color.fromRGBO(39, 105, 171, 1),
                                          fontFamily: 'Nunito',
                                          fontSize: 37,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Column(
                                            children: [
                                              Text(
                                                'email',
                                                style: TextStyle(
                                                  color: Colors.grey[700],
                                                  fontFamily: 'Nunito',
                                                  fontSize: 25,
                                                ),
                                              ),
                                              Text(
                                                // 'coba nih yang pertama',
                                                '${args.email}',
                                                style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      39, 105, 171, 1),
                                                  fontFamily: 'Nunito',
                                                  fontSize: 25,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 25,
                                              vertical: 8,
                                            ),
                                            child: Container(
                                              height: 50,
                                              width: 3,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                          Column(
                                            children: [
                                              Text(
                                                'Role',
                                                style: TextStyle(
                                                  color: Colors.grey[700],
                                                  fontFamily: 'Nunito',
                                                  fontSize: 25,
                                                ),
                                              ),
                                              Text(
                                                // 'Coba nih yang keduaaaa',
                                                '${args.isLurah ? 'Lurah' : 'Nakes'}',
                                                style: TextStyle(
                                                  color: Color.fromRGBO(
                                                      39, 105, 171, 1),
                                                  fontFamily: 'Nunito',
                                                  fontSize: 25,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 110,
                                right: 20,
                                child: InkWell(
                                  child: Icon(
                                    AntDesign.setting,
                                    color: Colors.grey[700],
                                    size: 30,
                                  ),
                                  onTap: () {
                                    launchUrl(Uri.parse(
                                        "${AppConfig.apiUrl}authentication/setting/"));
                                  },
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: height * 1.1,
                      width: width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 15),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Detail',
                              style: TextStyle(
                                color: Color.fromRGBO(39, 105, 171, 1),
                                fontSize: 27,
                                fontFamily: 'Nunito',
                              ),
                            ),
                            Divider(
                              thickness: 2.5,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 15),
                              height: height * 0.10,
                              width: width,
                              decoration: BoxDecoration(
                                color: Colors.blue[100],
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Text('Password: ${args!.password}',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 2, 7, 80),
                                    fontFamily: 'Nunito',
                                    fontSize: 20,
                                  ),
                                  textAlign: TextAlign.center),
                              // child: Text('Password: ${args!.password}'),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 15),
                              height: height * 0.10,
                              width: width,
                              decoration: BoxDecoration(
                                color: Colors.blue[100],
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Text('Province: ${args!.province}',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 2, 7, 80),
                                    fontFamily: 'Nunito',
                                    fontSize: 20,
                                  ),
                                  textAlign: TextAlign.center),
                              // child: Text('Province: ${args!.province}'),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 15),
                              height: height * 0.10,
                              width: width,
                              decoration: BoxDecoration(
                                color: Colors.blue[100],
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Text('Kota: ${args.city}',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 2, 7, 80),
                                    fontFamily: 'Nunito',
                                    fontSize: 20,
                                  ),
                                  textAlign: TextAlign.center),
                              // child: Text('Kota: ${args.city}'),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 15),
                              height: height * 0.10,
                              width: width,
                              decoration: BoxDecoration(
                                color: Colors.blue[100],
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Text('Kecamatan: ${args.district}',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 2, 7, 80),
                                    fontFamily: 'Nunito',
                                    fontSize: 20,
                                  ),
                                  textAlign: TextAlign.center),
                              // child: Text('Kecamatan: ${args.district}'),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 15),
                              height: height * 0.10,
                              width: width,
                              decoration: BoxDecoration(
                                color: Colors.blue[100],
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Text(
                                'Jenis Kelamin: ${args.gender}',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 2, 7, 80),
                                  fontFamily: 'Nunito',
                                  fontSize: 20,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              // child: Text('Jenis Kelamin: ${args.gender}'),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 15),
                              height: height * 0.10,
                              width: width,
                              decoration: BoxDecoration(
                                color: Colors.blue[100],
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Text('Nomor Telepon: ${args.phone}',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 2, 7, 80),
                                    fontFamily: 'Nunito',
                                    fontSize: 20,
                                  ),
                                  textAlign: TextAlign.center),
                              // child: Text('Nomor Telepon: ${args.phone}'),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 15),
                              height: height * 0.10,
                              width: width,
                              decoration: BoxDecoration(
                                color: Colors.blue[100],
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Text('Bio: ${args.bio}',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 2, 7, 80),
                                    fontFamily: 'Nunito',
                                    fontSize: 20,
                                  ),
                                  textAlign: TextAlign.center),
                              // child: Text('Bio: ${args.bio}'),
                            ),
                            SizedBox(
                              height: 10,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      );
    }
  }
}

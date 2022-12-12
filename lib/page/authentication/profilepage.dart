import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sehat_terus/models/user_profile.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:sehat_terus/page/main_page.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../config.dart';

class Profile extends StatefulWidget {
  final User? user;
  const Profile({Key? key, this.user}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _formKey = GlobalKey<FormState>();
  // var args = null;

  @override
  Widget build(BuildContext context) {
    print("profil: nakes? ");
    print(widget.user?.isNakes);
    final request = context.watch<CookieRequest>();

    // final args = ModalRoute.of(context)!.settings.arguments as UserArguments;
    // var args = null;

    if (!request.loggedIn) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Informasi Login'),
        ),
        body: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () async {
                    Navigator.pushReplacementNamed(context, '/login');
                  },
                  child: const Text('Login terlebih dahulu'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    Navigator.pushReplacementNamed(context, '/main');
                  },
                  child: const Text('Kembali ke halaman utama'),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      var args = widget.user;
      return Scaffold(
        appBar: AppBar(
          title: const Text('Informasi Login'),
        ),
        body: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Username: ${args!.username}'),
                Text('Email: ${args.email}'),
                Text('Password: ${args.password}'),
                Text('Role : ${args.isLurah ? 'Lurah' : 'Nakes'}'),
                Text('Nama Depan: ${args.firstName}'),
                Text('Nama Belakang: ${args.lastName}'),
                Text('Provinsi: ${args.province}'),
                Text('Kota: ${args.city}'),
                Text('Kecamatan: ${args.district}'),
                Text('Jenis Kelamin: ${args.gender}'),
                Text('Nomor Telepon: ${args.phone}'),
                // Text('Tanggal Lahir: ${args.birthDate}'),
                Text('Bio: ${args.bio}'),
                Text('Anda bisa mengatur profil anda pada website kami :'),
                TextButton(
                  child: const Text('Klik Disini'),
                  onPressed: () {
                    launchUrl(Uri.parse(
                        "${AppConfig.apiUrl}authentication/setting/"));
                  },
                ),
                ElevatedButton(
                  onPressed: () async {
                    await request.logout(
                        "${AppConfig.apiUrl}authentication/logout_flutter/");
                    Navigator.pushReplacementNamed(context, '/main');
                  },
                  child: const Text('Log Out'),
                )
              ],
            ),
          ),
        ),
      );
    }
  }
}

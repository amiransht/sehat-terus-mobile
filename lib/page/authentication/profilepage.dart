// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:sehat_terus/appbar.dart';
// import 'package:sehat_terus/models/user_profile.dart';
// import 'package:provider/provider.dart';
// import 'package:pbp_django_auth/pbp_django_auth.dart';
// import 'package:sehat_terus/page/main_page.dart';
// import 'package:sehat_terus/page/authentication/coba.dart';
// import 'package:url_launcher/url_launcher.dart';

// import '../../config.dart';

// class Profile extends StatefulWidget {
//   final User? user;
//   const Profile({Key? key, this.user}) : super(key: key);

//   @override
//   State<Profile> createState() => _ProfileState();
// }

// class _ProfileState extends State<Profile> {
//   final _formKey = GlobalKey<FormState>();
//   // var args = null;

//   @override
//   Widget build(BuildContext context) {
//     print("profil: nakes? ");
//     print(widget.user?.isNakes);
//     final request = context.watch<CookieRequest>();

//     // final args = ModalRoute.of(context)!.settings.arguments as UserArguments;
//     // var args = null;

//     if (request != null && request.loggedIn) {
//       return Scaffold(
//           body: ProfileScreen(
//         user: widget.user,
//       ));
//     } else {
//       return Form(
//         key: _formKey,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ElevatedButton(
//               onPressed: () async {
//                 Navigator.pushReplacementNamed(context, '/login');
//               },
//               child: const Text('Login terlebih dahulu'),
//             ),
//             ElevatedButton(
//               onPressed: () async {
//                 Navigator.pushReplacementNamed(context, '/main');
//               },
//               child: const Text('Kembali ke halaman utama'),
//             ),
//           ],
//         ),
//       );
//     } 
// }

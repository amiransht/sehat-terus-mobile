import 'package:flutter/material.dart';
import 'package:sehat_terus/models/user_profile.dart';
import 'package:provider/provider.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _formKey = GlobalKey<FormState>();
  // var args = null;

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    // final args = ModalRoute.of(context)!.settings.arguments as UserArguments;
    // var args = null;

    if (!request.loggedIn) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
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
                  child: const Text('Login first'),
                ),
                ElevatedButton(
                  onPressed: () async {
                    Navigator.pushReplacementNamed(context, '/main');
                  },
                  child: const Text('Back to main page'),
                ),
              ],
            ),
          ),
        ),
      );
    } else {
      var args = ModalRoute.of(context)!.settings.arguments as UserArguments;
      return Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
        ),
        body: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Username: ${args.username}'),
                Text('Email: ${args.email}'),
                // Text('Password: ${args.password}'),
                Text('Role : ${args.isLurah ? 'Lurah' : 'Nakes'}'),
                // ElevatedButton(
                //   onPressed: () async {
                //     final response = await request
                //         .logout("localhost:8000/authentication/logout_flutter/");
                //     if (response != null) {
                //       Navigator.pushReplacementNamed(context, '/login');
                //     }
                //   },
                //   child: const Text('Logout'),
                // ),
                ElevatedButton(
                  onPressed: () async {
                    Navigator.pushReplacementNamed(context, '/main');
                  },
                  child: const Text('Back to main page'),
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}

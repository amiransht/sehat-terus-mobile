import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sehat_terus/config.dart';

class LogOut extends StatefulWidget {
  const LogOut({Key? key}) : super(key: key);

  @override
  _LogOutState createState() => _LogOutState();
}

class _LogOutState extends State<LogOut> {
  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log Out'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            request.loggedIn
                ? ElevatedButton(
                    onPressed: () async {
                      await request.logout(
                          "${AppConfig.apiUrl}authentication/logout_flutter/");
                      Navigator.pushReplacementNamed(context, '/main');
                    },
                    child: const Text('Log Out'),
                  )
                : ElevatedButton(
                    onPressed: () async {
                      Navigator.pushReplacementNamed(context, '/login');
                    },
                    child: const Text('Log in'))
          ],
        ),
      ),
    );
  }
}

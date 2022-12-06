import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String username = '';
  String password1 = '';
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 50.0,
                ),
                const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 50.0,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Username',
                          hintText: 'Enter your username',
                          border: OutlineInputBorder(),
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your username';
                          }
                          return null;
                        },
                        onChanged: (String? value) {
                          setState(() {
                            username = value!;
                          });
                        },
                        onSaved: (String? value) {
                          setState(() {
                            username = value!;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          hintText: 'Enter your password',
                          border: OutlineInputBorder(),
                        ),
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                        onChanged: (String? value) {
                          setState(() {
                            password1 = value!;
                          });
                        },
                        onSaved: (String? value) {
                          setState(() {
                            password1 = value!;
                          });
                        },
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      ElevatedButton(
                        // onPressed: () {
                        //   if (_formKey.currentState!.validate()) {
                        //     ScaffoldMessenger.of(context).showSnackBar(
                        //       const SnackBar(
                        //         content: Text('Processing Data'),
                        //       ),
                        //     );
                        //   }
                        // },
                        onPressed: () async {
                          FocusScopeNode currentFocus = FocusScope.of(context);
                          if (!currentFocus.hasPrimaryFocus) {
                            currentFocus.unfocus();
                          }
                          if (_formKey.currentState!.validate()) {
                            setState(() {
                              isLoading = true;
                            });
                            final response = await request.login(
                                "https://sehat-terus.up.railway.app/authentication/login_flutter/",
                                {
                                  "username": username,
                                  "password": password1,
                                });
                            setState(() {
                              isLoading = false;
                            });
                            if (request.loggedIn) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Login Success'),
                                ),
                              );
                              Navigator.pushNamed(context, '/home');
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Login Failed'),
                                ),
                              );
                            }
                          }
                        },
                        child: const Text('LOGIN'),
                      ),
                      Container(
                        padding: const EdgeInsets.all(5),
                        child: RichText(
                          text: TextSpan(children: [
                            const TextSpan(
                                text: "No Account? ",
                                style: TextStyle(
                                    fontFamily: "Poppins", color: Colors.grey)),
                            TextSpan(
                              text: "Create a New One",
                              style: const TextStyle(
                                  fontFamily: "Poppins",
                                  color: Colors.indigo,
                                  fontWeight: FontWeight.w700),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  launchUrl(Uri.parse(
                                      "https://sehat-terus.up.railway.app/authentication/register/"));
                                },
                            )
                          ]),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

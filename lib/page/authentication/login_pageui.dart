import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sehat_terus/main.dart';
import 'package:sehat_terus/page/main_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/src/material/snack_bar.dart';
import 'package:sehat_terus/config.dart';
import 'package:sehat_terus/models/user_profile.dart';
import 'package:sehat_terus/core/colors.dart';

class LoginApp extends StatefulWidget {
  const LoginApp({Key? key}) : super(key: key);

  @override
  _LoginAppState createState() => _LoginAppState();
}

class _LoginAppState extends State<LoginApp> {
  final _formKey = GlobalKey<FormState>();
  String username = '';
  String password1 = '';
  bool isLoading = false;
  bool isLurah = false;

  @override
  Widget build(BuildContext context) {
    final request = context.watch<CookieRequest>();
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
               gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [0.1, 0.4, 0.9],
                  colors: [
                    Color.fromARGB(255, 210, 241, 246),
                    Color.fromARGB(255, 182, 224, 230),
                    BaseColors.green,
                  ])),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                width: 300,
                // child: Container(
                //   image: Image.asset(
                //     "assets/5m-5.png",
                //     height: 60,
                //   ),
                // ),
              ),
              const SizedBox(
                height: 0,
              ),
              Container(
                margin: EdgeInsets.all(60),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      "Hi!",
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: BaseColors.green),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Please Login to Your Account",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Container(
                              width: 260,
                              height: 60,
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Username',
                                  hintText: 'Enter your username',
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                  ),
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
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            Container(
                              width: 260,
                              height: 60,
                              child: TextFormField(
                                obscureText: true,
                                decoration: const InputDecoration(
                                  labelText: 'Password',
                                  suffix: Icon(
                                    FontAwesomeIcons.eyeSlash,
                                    color: Colors.red,
                                  ),
                                  hintText: 'Enter your password',
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                  ),
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
                            ),
                            const SizedBox(
                              height: 20.0,
                            ),
                            GestureDetector(
                              child: Container(
                                alignment: Alignment.center,
                                width: 250,
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(60)),
                                    color: BaseColors.green),
                                child: TextButton(
                                  onPressed: () async {
                                    FocusScopeNode currentFocus =
                                        FocusScope.of(context);
                                    if (!currentFocus.hasPrimaryFocus) {
                                      currentFocus.unfocus();
                                    }
                                    if (_formKey.currentState!.validate()) {
                                      setState(() {
                                        isLoading = true;
                                      });
                                      final response = await request.login(
                                          "${AppConfig.apiUrl}authentication/login_flutter/",
                                          //"http://localhost:8000/authentication/login_flutter/",
                                          {
                                            "username": username,
                                            "password": password1,
                                          });
                                      setState(() {
                                        isLoading = false;
                                      });

                                      if (request.loggedIn) {
                                        if (response["is_lurah"]) {
                                          isLurah = true;
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                  '(Login Berhasil) Selamat Datang Kembali LURAH!'),
                                              backgroundColor: Colors.teal,
                                              behavior:
                                                  SnackBarBehavior.floating,
                                            ),
                                          );

                                          // Navigator.of(context)
                                          //     .pushReplacementNamed("/profile",
                                          //         arguments: User(
                                          //             response["is_lurah"],
                                          //             response["is_nakes"],
                                          //             response["username"],
                                          //             response["email"],
                                          //             password1,
                                          //             true,
                                          //             response["first_name"],
                                          //             response["last_name"],
                                          //             response["province"],
                                          //             response["bio"],
                                          //             response["city"],
                                          //             response["gender"],
                                          //             response["number_phone"],
                                          //             response["date_of_birth"],
                                          //             response["district"]));
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content: Text(
                                                  '(Login Berhasil) Selamat Datang Kembali NAKES!'),
                                              backgroundColor: Colors.teal,
                                              behavior:
                                                  SnackBarBehavior.floating,
                                            ),
                                          );
                                        }
                                        User userLoggedIn = User(
                                            isLurah: response["is_lurah"],
                                            isNakes: response["is_nakes"],
                                            username: response["username"],
                                            email: response["email"],
                                            password: password1,
                                            isLoggedIn: true,
                                            firstName: response["first_name"],
                                            lastName: response["last_name"],
                                            province: response["province"],
                                            bio: response["bio"],
                                            city: response["city"],
                                            gender: response["gender"],
                                            phone: response["number_phone"],
                                            birthDate: response["date_of_birth"],
                                            district: response["district"]);
                                        
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => MainPage(setPageAtIndex: 0, userLoggedIn: userLoggedIn,),
                                          ),
                                        );
                                      }
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                              'Email atau password yang anda masukkan tidak ditemukan'),

                                          backgroundColor: Colors.teal,
                                          behavior: SnackBarBehavior.floating,
                                          // action: SnackBarAction(
                                          //   label: 'Dismiss',
                                          //   disabledTextColor: Colors.white,
                                          //   textColor: Colors.yellow,
                                          //   onPressed: () {
                                          //     //Do whatever you want
                                          //   },
                                          // ),
                                        ),
                                      );
                                    }
                                  },
                                  child: const Text(
                                    'LOGIN',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: BaseColors.white),
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(5),
                              child: RichText(
                                text: TextSpan(children: [
                                  const TextSpan(
                                      text: "No Account? ",
                                      style: TextStyle(
                                          fontFamily: "Poppins",
                                          color: Colors.grey)),
                                  TextSpan(
                                    text: "Create a New One",
                                    style: const TextStyle(
                                        fontFamily: "Poppins",
                                        color:
                                            Color.fromARGB(255, 156, 224, 235),
                                        fontWeight: FontWeight.w700),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.pushNamed(context, '/signup');
                                      },
                                  )
                                ]),
                              ),
                            )
                          ],
                        )),
                    const SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 30, 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // TextButton(
                          //   onPressed: click,
                          //   child: const Text(
                          //     "Forget Password",
                          //     style: TextStyle(color: Colors.deepOrange),
                          //   ),
                          // )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

void showSnackBar(BuildContext context) {
  final snackBar = SnackBar(
    content: Text('Hi, Flutter developers'),
    backgroundColor: Colors.teal,
    behavior: SnackBarBehavior.floating,
    action: SnackBarAction(
      label: 'Dismiss',
      disabledTextColor: Colors.white,
      textColor: Colors.yellow,
      onPressed: () {
        //Do whatever you want
      },
    ),
    onVisible: () {
      //your code goes here
    },
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

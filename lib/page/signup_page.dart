import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:sehat_terus/config.dart';
import 'package:email_validator/email_validator.dart';

class SignUpApp extends StatefulWidget {
  const SignUpApp({Key? key}) : super(key: key);

  @override
  _SignUpAppState createState() => _SignUpAppState();
}

class _SignUpAppState extends State<SignUpApp> {
  final _formKey = GlobalKey<FormState>();
  String username = '';
  String password1 = '';
  String password2 = '';
  String email = '';

  bool isLoading = false;
  String role = 'Lurah';
  final List<String> _roles = ['Nakes', 'Lurah'];

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
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                Color.fromARGB(255, 106, 181, 224),
                Color.fromARGB(255, 128, 180, 228),
                Colors.blue,
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
                //     height: 40,
                //   ),
                // ),
              ),
              const SizedBox(
                height: 0,
              ),
              Container(
                width: 325,
                height: 470,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    const Text(
                      "Hi!",
                      style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 137, 197, 247)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "Register Yourself as Nakes/Lurah",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Container(
                              width: 260,
                              height: 40,
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
                              height: 10.0,
                            ),
                            Container(
                              width: 260,
                              height: 40,
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  labelText: 'Email',
                                  hintText: 'youremail@example.com',
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                  ),
                                ),
                                validator: (String? value) {
                                  bool isValid =
                                      EmailValidator.validate(value!);
                                  if (value == null ||
                                      value.isEmpty ||
                                      !isValid) {
                                    return 'Please enter a valid email (example@example.example)';
                                  }
                                  return null;
                                },
                                onChanged: (String? value) {
                                  setState(() {
                                    email = value!;
                                  });
                                },
                                onSaved: (String? value) {
                                  setState(() {
                                    email = value!;
                                  });
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            Container(
                              width: 260,
                              height: 40,
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
                              height: 10.0,
                            ),
                            Container(
                              width: 260,
                              height: 40,
                              child: TextFormField(
                                obscureText: true,
                                decoration: const InputDecoration(
                                  labelText: 'Password Confirmation',
                                  suffix: Icon(
                                    FontAwesomeIcons.eyeSlash,
                                    color: Colors.red,
                                  ),
                                  hintText: 'Confirm password',
                                  border: OutlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(8)),
                                  ),
                                ),
                                validator: (String? value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter password for confirmation';
                                  }
                                  return null;
                                },
                                onChanged: (String? value) {
                                  setState(() {
                                    password2 = value!;
                                  });
                                },
                                onSaved: (String? value) {
                                  setState(() {
                                    password2 = value!;
                                  });
                                },
                              ),
                            ),
                            const SizedBox(
                              height: 10.0,
                            ),
                            const Align(
                              alignment: Alignment.center,
                              child: Text(
                                'Choose your role',
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            RadioGroup<String>.builder(
                              direction: Axis.horizontal,
                              horizontalAlignment:
                                  MainAxisAlignment.spaceBetween,
                              groupValue: role,
                              onChanged: (value) => setState(() {
                                role = value!;
                              }),
                              items: _roles,
                              itemBuilder: (item) => RadioButtonBuilder(
                                item,
                                textPosition: RadioButtonTextPosition.right,
                              ),
                              textStyle: const TextStyle(fontSize: 12),
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
                                    gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [
                                          Color.fromARGB(255, 123, 175, 199),
                                          Color.fromARGB(255, 97, 145, 199),
                                          Color.fromARGB(255, 98, 182, 221),
                                        ])),
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
                                          // "http://localhost:8000/authentication/register_flutter/",
                                          "${AppConfig.apiUrl}authentication/register_flutter/",
                                          {
                                            "username": username,
                                            "password1": password1,
                                            "password2": password2,
                                            "email": email,
                                            "role_user": role
                                          });
                                      setState(() {
                                        isLoading = false;
                                      });
                                      if (request.loggedIn) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          const SnackBar(
                                            content: Text(
                                                '(Registrasi Berhasil) Silahkan login untuk melanutkan'),
                                            backgroundColor: Colors.teal,
                                            behavior: SnackBarBehavior.floating,
                                          ),
                                          // ScaffoldMessenger.of(context)
                                          //     .showSnackBar(
                                          //   const SnackBar(
                                          //     content: Text(
                                          //         '(Registrasi Berhasil) Selamat Datang !'),
                                          //     backgroundColor: Colors.teal,
                                          //     behavior: SnackBarBehavior.floating,
                                          //     // action: SnackBarAction(
                                          //     //   label: 'Dismiss',
                                          //     //   disabledTextColor: Colors.white,
                                          //     //   textColor: Colors.yellow,
                                          //     //   onPressed: () {
                                          //     //     //Do whatever you want
                                          //     //   },
                                          //     // ),
                                          //   ),
                                        );
                                        Navigator.pushNamed(context, '/login');
                                      } else {
                                        showSnackBarError(
                                            context, response['message']);
                                      }
                                    }
                                  },
                                  child: const Text(
                                    'Register',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromARGB(255, 14, 2, 48)),
                                  ),
                                ),
                              ),
                            ),
                            // Container(
                            //   padding: const EdgeInsets.all(5),
                            //   child: RichText(
                            //     text: TextSpan(children: [
                            //       const TextSpan(
                            //           text: "No Account? ",
                            //           style: TextStyle(
                            //               fontFamily: "Poppins",
                            //               color: Colors.grey)),
                            //       TextSpan(
                            //         text: "Create a New One",
                            //         style: const TextStyle(
                            //             fontFamily: "Poppins",
                            //             color: Colors.indigo,
                            //             fontWeight: FontWeight.w700),
                            //         recognizer: TapGestureRecognizer()
                            //           ..onTap = () {
                            //             print("register");
                            //             launchUrl(Uri.parse(
                            //                 "${AppConfig.apiUrl}authentication/register/"));
                            //           },
                            //       )
                            //     ]),
                            //   ),
                            // )
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

void showSnackBarError(BuildContext context, String teks) {
  final snackBar = SnackBar(
    content: Text(teks),
    backgroundColor: Color.fromARGB(255, 150, 0, 0),
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

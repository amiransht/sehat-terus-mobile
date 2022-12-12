import 'package:pbp_django_auth/pbp_django_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:group_radio_button/group_radio_button.dart';
import 'package:sehat_terus/config.dart';
import 'package:email_validator/email_validator.dart';
import 'package:sehat_terus/core/colors.dart';

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
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  stops: [
                0.1,
                0.4,
                0.9
              ],
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
              const SizedBox(
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
                margin: EdgeInsets.all(60),
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
                          color: BaseColors.green),
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 60),
                              height: 40,
                              child: TextFormField(
                                scrollPadding: EdgeInsets.all(0),
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
                              margin: EdgeInsets.symmetric(horizontal: 60),
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
                              margin: EdgeInsets.symmetric(horizontal: 60),
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
                              margin: EdgeInsets.symmetric(horizontal: 60),
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
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 60),
                              height: 40,
                              alignment: Alignment.center,
                              // mainAxisAlignment: MainAxisAlignment.center,
                              child: RadioGroup<String>.builder(
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
                                    color: BaseColors.green,),
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
                                                'Registrasi Berhasil! Silahkan login untuk melanjutkan'),
                                            backgroundColor: Colors.teal,
                                            behavior: SnackBarBehavior.floating,
                                          ),
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
                                        color: BaseColors.white),
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
                      height: 25,
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
    backgroundColor: const Color.fromARGB(255, 150, 0, 0),
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

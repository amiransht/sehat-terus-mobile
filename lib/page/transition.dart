import 'package:sehat_terus/models/user_profile.dart';
import 'package:sehat_terus/page/lurah/show_pasien.dart';
import 'package:sehat_terus/page/nakes/nakes_page.dart';
import 'package:flutter/material.dart';

class TransitionPage extends StatefulWidget {
  final User? user;
  const TransitionPage({Key? key, this.user}) : super(key: key);

  @override
  State<TransitionPage> createState() => _TransitionPageState();
}

class _TransitionPageState extends State<TransitionPage> {
  @override
  Widget build(BuildContext context) {
    if (widget.user!.isLurah) {
      return LurahPage(user: widget.user);
    }
    print("otw nakes");
    return NakesPage(user: widget.user);
  }
}

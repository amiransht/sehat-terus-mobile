import 'package:countup/countup.dart';
import 'package:sehat_terus/models/user_profile.dart';
import 'package:flutter/material.dart';
import 'package:sehat_terus/core/colors.dart';
import 'package:sehat_terus/page/lurah/show_pasien.dart';
import 'package:sehat_terus/page/nakes/nakes_page.dart';

class FloatingButton extends StatelessWidget {
  final User? user;
  const FloatingButton({
    Key? key,
    this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("test");
    if (user!.isLoggedIn && user!.isLurah) {
      return FloatingActionButton(
          backgroundColor: BaseColors.green,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LurahPage(
                  user: user,
                ),
              ),
            );
          },
          child:Image.asset("assets/logoH.png"));
    } else if (user!.isLoggedIn && user!.isNakes) {
      return FloatingActionButton(
          backgroundColor: BaseColors.green,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => NakesPage(
                  user: user,
                ),
              ),
            );
          },
          child: Image(image: AssetImage("assets/logoH.png")));
    } else {
      return FloatingActionButton(
          backgroundColor: Colors.transparent,
          onPressed: () {},
          child: Text(""));
    }
  }
}

import 'package:flutter/material.dart';
import 'package:sehat_terus/core/colors.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color _iconPressed = BaseColors.black;
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
        height: 69.0,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    padding: EdgeInsets.all(0),
                    iconSize: 30,
                    icon: Icon(Icons.home, color: (_iconPressed)),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/home');
                    }),
                const Text("Home",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, color: BaseColors.black)),
                const SizedBox(
                  height: 5,
                )
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    padding: EdgeInsets.all(0),
                    iconSize: 30,
                    icon: const Icon(Icons.bar_chart_outlined),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/data');
                      print(ModalRoute.of(context)?.settings.name);
                    }),
                const Text("Data",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, color: BaseColors.black)),
                const SizedBox(
                  height: 5,
                )
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    padding: EdgeInsets.all(0),
                    iconSize: 30,
                    icon: const Icon(Icons.feed_outlined),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/home');
                      print(ModalRoute.of(context)?.settings.name);
                    }),
                const Text("Blog",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, color: BaseColors.black)),
                const SizedBox(
                  height: 5,
                )
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    padding: EdgeInsets.all(0),
                    iconSize: 30,
                    icon: const Icon(Icons.person),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/home');
                      print(ModalRoute.of(context)?.settings.name);
                    }),
                const Text("Profil",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, color: BaseColors.black)),
                const SizedBox(
                  height: 5,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

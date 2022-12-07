import 'package:flutter/material.dart';
import 'package:sehat_terus/core/colors.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

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
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    splashRadius: 20.0,
                    splashColor: BaseColors.green.withOpacity(0.3),
                    highlightColor: BaseColors.green.withOpacity(0.3),
                    padding: EdgeInsets.all(0.0),
                    iconSize: 20,
                    icon: Icon(Icons.home),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/home');
                    }),
                const Text("Home",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, color: BaseColors.black)),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    splashRadius: 20.0,
                    splashColor: BaseColors.green.withOpacity(0.3),
                    highlightColor: BaseColors.green.withOpacity(0.3),
                    padding: EdgeInsets.all(0),
                    iconSize: 20,
                    icon: const Icon(Icons.bar_chart_outlined),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/data');
                      print(ModalRoute.of(context)?.settings.name);
                    }),
                const Text("Data",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, color: BaseColors.black)),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    splashRadius: 20.0,
                    splashColor: BaseColors.green.withOpacity(0.3),
                    highlightColor: BaseColors.green.withOpacity(0.3),
                    padding: EdgeInsets.all(0),
                    iconSize: 20,
                    icon: const Icon(Icons.feed_outlined),
                    onPressed: () {
                      // BaseColors.green;
                      Navigator.pushReplacementNamed(context, '/home');
                      print(ModalRoute.of(context)?.settings.name);
                    }),
                const Text("Blog",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, color: BaseColors.black)),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                    splashRadius: 20.0,
                    splashColor: BaseColors.green.withOpacity(0.3),
                    highlightColor: BaseColors.green.withOpacity(0.3),
                    padding: EdgeInsets.all(0),
                    iconSize: 20,
                    icon: const Icon(Icons.person),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/home');
                      print(ModalRoute.of(context)?.settings.name);
                    }),
                const Text("Profil",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12, color: BaseColors.black)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // IconButton _buildHomeButton(){

  // }
}

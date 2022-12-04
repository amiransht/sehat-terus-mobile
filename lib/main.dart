import 'package:flutter/material.dart';
import 'package:sehat_terus/page/home_page.dart';
import 'core/routes/routes.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Task Management',
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.home,
      onGenerateRoute: RouterGenerator.generateRoutes,
    );
  }
}

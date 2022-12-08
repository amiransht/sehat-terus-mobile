import 'package:flutter/material.dart';
import 'package:pbp_django_auth/pbp_django_auth.dart';
import '../core/colors.dart';

class NakesPage extends StatefulWidget {
  const NakesPage({Key? key}) : super(key: key);

  @override
  State<NakesPage> createState() => _NakesPageState();
}

class _NakesPageState extends State<NakesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          hoverColor: BaseColors.white.withOpacity(0.3),
          highlightColor: BaseColors.white.withOpacity(0.3),
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () => Navigator.pushReplacementNamed(context, '/main'),
        ),
        // iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Color(0xFF17A2B8),
        elevation: 0,
      ),
      extendBodyBehindAppBar: true,
      body: Scaffold(),
    );
  }
}

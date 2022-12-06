import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sehat_terus/core/colors.dart';
import 'package:sehat_terus/core/routes/routes.dart';

class DataPage extends StatefulWidget {
  const DataPage({Key? key}) : super(key: key);

  static const routeName = '/data';

  @override
  State<DataPage> createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Text("hello")
        ],
      ),
    );
  }


}

import 'package:flutter/material.dart';
import 'page/home_page.dart';

Drawer buildDrawer(BuildContext context) {
  return Drawer(
    child: ListView(
      children: [
        // Menambahkan clickable menu
        ListTile(
          title: const Text('HomePage'),
          onTap: () {
            // Route menu ke halaman utama
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
        ),
        ListTile(
          title: const Text('HomePage'),
          onTap: () {
            // Route menu ke halaman form
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
        ),
        ListTile(
          title: const Text('HomePage'),
          onTap: () {
            // Route menu ke halaman form
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
        ),
        ListTile(
          title: const Text('My Watch List'),
          onTap: () {
            // Route menu ke halaman form
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          },
        ),
      ],
    ),
  );
}

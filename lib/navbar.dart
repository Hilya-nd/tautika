
import 'package:flutter/material.dart';

import 'package:tautika/pages/home.dart';
import 'package:tautika/pages/search.dart';
import 'package:tautika/pages/create_content.dart';
import 'package:tautika/pages/classes.dart';
import 'package:tautika/pages/profile.dart';

class navbar extends StatefulWidget {
  const navbar({super.key});

  @override
  State<navbar> createState() => _navbarState();
}

class _navbarState extends State<navbar> {
  int sekarang = 0;

  void taptap(int index) {
    setState(() {
      sekarang = index;
    });
  }

  final List<Widget> halaman = [
    const HomePage(),
    const SearchPage(),
    const CreateContentPage(),
    const ClassesPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: halaman.elementAt(sekarang),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: sekarang,
        onTap: taptap,
        selectedItemColor: const Color(0xFF3478F6),
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home_filled),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle, size: 34),
            label: 'Buat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book_outlined),
            label: 'Kelas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';

class ClassesPage extends StatelessWidget {
  const ClassesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Kelas Saya')),
      body: const Center(
        child: Text('Halaman Kelas'),
      ),
    );
  }
}
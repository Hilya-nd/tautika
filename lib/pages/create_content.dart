import 'package:flutter/material.dart';

class CreateContentPage extends StatelessWidget {
  const CreateContentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Buat Konten')),
      body: const Center(
        child: Text('Upload Tugas atau Buat Kuis'),
      ),
    );
  }
}
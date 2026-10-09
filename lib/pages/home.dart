
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'TAUTIKA',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(0xFF173B78),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: const Center(
        child: Text(
          'Home / Feed TAUTIKA',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
// import 'package:tautika/navbar.dart';
import 'package:tautika/pages/splash.dart';
// import 'package:tautika/pages/home.dart';

void main() {
    runApp(const MyApp());
}

class MyApp extends StatelessWidget {
    const MyApp({super.key});
    
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'TAUTIKA',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                primarySwatch: Colors.blue,
                scaffoldBackgroundColor: Colors.white,
            ),
        home: const SplashPage(),
        );
  }
}
// in mvc architecture (model view and controler)
import 'package:flutter/material.dart';
import 'package:newsapp/view/home.dart';
import 'package:newsapp/view/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool showingSplashScreen = true;

  loadHomePage() {
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        showingSplashScreen = false;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    loadHomePage();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News Ocean',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: showingSplashScreen ? const SplashScreen() : HomeScreen(),
    );
  }
}

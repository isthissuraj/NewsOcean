// in mvc architecture (model view and controler)
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:newsapp/view/home.dart';
import 'package:newsapp/view/splash.dart';

void main() async {
  //initialling the hive in void main 
  await Hive.initFlutter();
  //then open a box (THE STORE BOX NAME IN VARIABLE ONLY) where you have store the data
  await Hive.openBox('ThemeBox');
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
    //to update the UI without using setState()
    return ValueListenableBuilder(
      valueListenable: Hive.box("ThemeBox").listenable(),
      builder: (context, box, child) {
        //saving the value inside the hive box,
        final isDark = box.get('isDark', defaultValue: false);
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          //switching between light and dark theme
          theme: isDark ? ThemeData.dark() : ThemeData(),
          title: 'News Ocean',
          home: showingSplashScreen ? const SplashScreen() : const HomeScreen(),
        );
      },
    );
  }
}

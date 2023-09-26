import 'package:flutter/material.dart';

import 'AdminScreen.dart';
import 'MainScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    var pageController = PageController();
    var kioskApp = MaterialApp(
      home: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: [
          MainScreen(),
          AdminScreen(),
        ],
      ),
    );

    return kioskApp;
  }
}

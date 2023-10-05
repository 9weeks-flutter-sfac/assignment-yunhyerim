import 'package:assignment2/MainPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "Neo",
      ),
      home: Container(
          decoration: BoxDecoration(
            // color: Colors.white.withOpacity(0.5),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                  'assets/vika-strawberrika-19R4G17VXrE-unsplash.jpg'),
            ),
          ),
          child: MainPage()),
    );
  }
}

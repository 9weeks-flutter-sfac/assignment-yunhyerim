import 'package:assignment1/ImageContainer.dart';
import 'package:flutter/material.dart';

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
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text("포토네컷"),
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
        backgroundColor: Colors.black,
        body: Center(
          child: ListView(
            children: [
              ImageContainer(),
              ImageContainer(),
              ImageContainer(),
              ImageContainer(),
            ],
          ),
        ),
      ),
    );
  }
}

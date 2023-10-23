// ignore_for_file: prefer_const_constructors

import 'package:assignment1/firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'view/pages/login_page.dart';

void main() async {
  //runApp전 꼭 있어야할 함수.
  WidgetsFlutterBinding.ensureInitialized(); //메인 함수에서 비동기 함수(await)가 있을때만 해줘야함.
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen(
      (event) {
        if (event != null) {
          print("유저 있음");
        } else {
          print('회원가입이나 로그인 필요');
        }
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

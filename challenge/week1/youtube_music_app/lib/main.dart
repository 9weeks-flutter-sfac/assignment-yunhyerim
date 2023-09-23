// import 'package:assignment2/MusicTile.dart';
import 'package:flutter/material.dart';

import 'MusicTile.dart';
import 'PlayListPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var youtubeMusicAppVer2 = MaterialApp(
        // dark 테마 적용
        theme: ThemeData.from(colorScheme: ColorScheme.dark()),
        home: PlayListPage());

    return youtubeMusicAppVer2;
  }
}

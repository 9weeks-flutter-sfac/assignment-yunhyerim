import 'package:assignment1/controller/app_setting_controller.dart';
import 'package:assignment1/controller/coin_controller.dart';
import 'package:assignment1/controller/notification_icon_controller.dart';
import 'package:assignment1/notification.dart';
import 'package:assignment1/page/main_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
  void initState() {
    // 초기화
    FlutterLocalNotification.init();
    // 3초 후 권한 요청
    Future.delayed(Duration(seconds: 3),
        FlutterLocalNotification.requestNotificationPermission());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Get.put(CoinController());
    Get.put(AppSettingController(
        isSoundOn: true,
        isNotificationOn: true,
        appVersion: "0.0.1",
        appName: "Coin Counter",
        appAuthor: "Hyerim",
        appPackageName: "Assignment1",
        lastUpdated: DateTime.now()));
    Get.put(NotificationIconController());

    print("NOW ${DateTime.now()}");

    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MainPage(),
    );
  }
}

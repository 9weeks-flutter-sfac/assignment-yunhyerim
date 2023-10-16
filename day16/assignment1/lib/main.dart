import 'package:assignment1/controller/auth_controller.dart';
import 'package:assignment1/controller/login_controller.dart';
import 'package:assignment1/controller/main_controller.dart';
import 'package:assignment1/view/login_page.dart';
import 'package:assignment1/view/main_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      initialBinding: BindingsBuilder(() {
        Get.put(AuthController()); //1
        Get.lazyPut(() => LoginController()); //대기상태 -> loginpage로 가면 활성
        Get.lazyPut(() => MainController()); //대기상태 -> loginpage로 가면 활성
      }),
      getPages: [
        GetPage(name: LoginPage.route, page: () => LoginPage()),
        GetPage(name: MainPage.route, page: () => MainPage()),
      ],
      home: Scaffold(
        body: Center(
          child: TextButton(
            onPressed: () => Get.toNamed(LoginPage.route),
            child: Text("Hello World"),
          ),
        ),
      ),
    );
  }
}

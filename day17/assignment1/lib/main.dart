import 'package:assignment1/controller/login_controller.dart';
import 'package:assignment1/controller/main_controller.dart';
import 'package:assignment1/controller/secret_controller.dart';
import 'package:assignment1/controller/secret_upload_controller.dart';
import 'package:assignment1/controller/sign_up_controller.dart';
import 'package:assignment1/controller/user_list_controller.dart';
import 'package:assignment1/view/page/login_page.dart';
import 'package:assignment1/view/page/main_page.dart';
import 'package:assignment1/view/page/secret_upload_page.dart';
import 'package:assignment1/view/page/sign_up_page.dart';
import 'package:assignment1/view/page/user_list_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'controller/auth_controller.dart';
import 'view/page/secret_page.dart';

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
      initialBinding: BindingsBuilder(() {
        Get.put(AuthController());
        Get.lazyPut(() => MainController(), fenix: true);
        Get.lazyPut(() => LoginController(), fenix: true);
        Get.lazyPut(() => SignUpController(), fenix: true);
        Get.lazyPut(() => UserListController(), fenix: true);
        Get.lazyPut(() => SecretController(), fenix: true);
        Get.lazyPut(() => SecretUploadController(), fenix: true);
      }),
      getPages: [
        GetPage(name: MainPage.route, page: () => MainPage()),
        GetPage(name: LoginPage.route, page: () => LoginPage()),
        GetPage(name: SignUpPage.route, page: () => SignUpPage()),
        GetPage(name: SecretUploadPage.route, page: () => SecretUploadPage()),
        GetPage(name: SecretPage.route, page: () => SecretPage()),
        GetPage(name: UserListPage.route, page: () => UserListPage()),
      ],
      home: LoginPage(),
    );
  }
}

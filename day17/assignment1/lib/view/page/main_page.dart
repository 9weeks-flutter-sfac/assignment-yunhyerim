import 'package:assignment1/controller/auth_controller.dart';
import 'package:assignment1/controller/main_controller.dart';
import 'package:assignment1/view/page/login_page.dart';
import 'package:assignment1/view/page/secret_page.dart';
import 'package:assignment1/view/page/user_list_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends GetView<MainController> {
  const MainPage({super.key});

  static const String route = "/main";

  @override
  Widget build(BuildContext context) {
    var authController = Get.find<AuthController>();
    return Scaffold(
      backgroundColor: Colors.amberAccent.shade400,
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              Obx(
                () => Text(
                  "말하는 호박 (${authController.user!.username})",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black),
      body: PageView(
        controller: controller.pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          SecretPage(),
          UserListPage(),
        ],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "UserList",
            ),
          ],
          onTap: (index) {
            controller.pageController.jumpToPage(index);
            controller.currentIndex.value = index;
          },
          currentIndex: controller.currentIndex.value,
          selectedItemColor: Colors.indigo,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          backgroundColor: Colors.amber.shade300,
        ),
      ),
    );
  }
}

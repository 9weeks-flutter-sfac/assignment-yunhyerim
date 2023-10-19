import 'package:assignment1/controller/secret_controller.dart';
import 'package:assignment1/controller/user_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  var pageController = PageController();
  RxInt currentIndex = 0.obs;

  onPageTapped(int tappedIndex) {
    print("TAPPEDINDEX : $tappedIndex");
    pageController.jumpToPage(tappedIndex);
    currentIndex(tappedIndex);
  }

  @override
  void dispose() {
    Get.find<SecretController>().scrollController.dispose();
    Get.find<UserListController>().scrollController.dispose();
    super.dispose();
  }
}

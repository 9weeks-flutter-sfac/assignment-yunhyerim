import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  var pageController = PageController();
  RxInt currentIndex = 0.obs;
  // RxBool fabIsVisibled = true.obs;

  onPageTapped(int tappedIndex) {
    print("TAPPEDINDEX : $tappedIndex");
    pageController.jumpToPage(tappedIndex);
    currentIndex(tappedIndex);
  }
}

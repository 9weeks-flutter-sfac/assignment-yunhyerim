import 'package:assignment1/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var idController = TextEditingController(text: "test1@example.com");
  var pwController = TextEditingController(text: "123456789");

  login() {
    Get.find<AuthController>().login(idController.text, pwController.text);
  }
}

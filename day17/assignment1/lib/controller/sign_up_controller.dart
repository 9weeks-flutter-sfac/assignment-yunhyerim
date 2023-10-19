import 'package:assignment1/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  var emailController = TextEditingController(text: "testEmail@example.com");
  var pwController = TextEditingController(text: "123456789");
  var pwCheckController = TextEditingController(text: "123456789");
  var usernameController = TextEditingController(text: "testusername");

  signUp() {
    Get.find<AuthController>().signUp(emailController.text, pwController.text,
        pwCheckController.text, usernameController.text);
  }
}

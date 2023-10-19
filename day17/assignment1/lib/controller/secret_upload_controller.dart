import 'package:assignment1/controller/auth_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecretUploadController extends GetxController {
  var postController = TextEditingController();
  Dio _dio = Dio();

  postSecret(String secret) async {
    String url = "http://52.79.115.43:8090/api/collections/secrets/records";
    var authController = Get.find<AuthController>();
    String? author = authController.user!.id;
    String? authorName = authController.user!.username;

    try {
      var request = await _dio.post(url, data: {
        "secret": secret,
        "author": author,
        "authorName": authorName,
      });
      print(request.statusCode);
      print(request.statusMessage);
    } catch (e) {
      e.printError();
    }
  }
}

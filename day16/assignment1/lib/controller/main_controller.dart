// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_print
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:assignment1/controller/auth_controller.dart';
import 'package:assignment1/model/document.dart';

class MainController extends GetxController {
  var pageController = PageController();
  RxInt currentPage = 0.obs;
  RxList<Document>? documents = <Document>[].obs;

  readDocuments(String token) async {
    Dio dio = Dio();

    print("저장된 토큰 = ${token}");
    var res = await dio.get(
      "http://52.79.115.43:8090/api/collections/documents/records",
      options: Options(headers: {
        'authorization': token,
      }),
    );

    var itemData = List<Map<String, dynamic>>.from(res.data["items"]);
    List<Document> documentList =
        itemData.map((e) => Document.fromMap(e)).toList();
    documents!.clear();
    documents?.addAll(documentList);

    print("============== document1 = ${documents?.first}");
    print("============== document2 = ${documents?.last}");

    update();
    refresh();
  }

  void onPageTapped(int value) {
    pageController.jumpToPage(value);
    currentPage(value);
  }

  void logout() {
    Get.find<AuthController>().logout();
  }
}

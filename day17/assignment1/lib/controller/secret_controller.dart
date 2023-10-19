import 'package:assignment1/model/secret.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecretController extends GetxController {
  Dio _dio = Dio();
  RxList<Secret> secretList = <Secret>[].obs;
  final _scrollController = ScrollController();

  ScrollController get scrollController => _scrollController;

  // RxList<Secret> get secretList => _secretList;

  getSecretList() async {
    print("======= GETSECRETLIST()");
    String path =
        "http://52.79.115.43:8090/api/collections/secrets/records?sort=-created";
    var response = await _dio.get(path);
    // print("${response.data["items"]}");

    var mapList = List<Map<String, dynamic>>.from(response.data["items"]);
    // print("===== MAPLIST : $mapList");

    var toList = mapList.map((e) => Secret.fromMap(e)).toList();
    if (secretList.isNotEmpty) {
      secretList.clear();
    }

    secretList.addAll(toList);

    // print("_SECRETLIST : ${secretList}");
  }

  @override
  void dispose() {
    print("SecretController.dispose");
    scrollController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}

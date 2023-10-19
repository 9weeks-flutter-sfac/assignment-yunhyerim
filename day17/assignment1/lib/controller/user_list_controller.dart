import 'package:assignment1/controller/auth_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/user.dart';

class UserListController extends GetxController {
  Dio dio = Dio();
  RxList<User> users = <User>[].obs;
  final _scrollController = ScrollController();

  ScrollController get scrollController => _scrollController;

  Future<void> getUserList() async {
    print("===== getuserlist");

    String url =
        "http://52.79.115.43:8090/api/collections/users/records?sort=-created";
    var response = await dio.get(url);

    print("======= ${response.data["items"].runtimeType}");

    var mapsList = List<Map<String, dynamic>>.from(response.data["items"]);
    // print("======= MAPSLIST = ${mapsList}");
    var userList = mapsList.map((e) => User.fromMap(e)).toList();
    // print("========= USERLIST $userList");

    users(userList);

    // print("===== USERS = $users");
  }

  logout() {
    Get.find<AuthController>().logout();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}

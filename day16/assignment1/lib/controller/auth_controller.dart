// ignore_for_file: avoid_print

import 'package:assignment1/util/api_routes.dart';
import 'package:assignment1/view/login_page.dart';
import 'package:assignment1/view/main_page.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../model/user.dart';

class AuthController extends GetxController {
  final Rxn<User> _user = Rxn();
  String _token = "";
  Dio dio = Dio();

  User? get user => _user.value;
  String? get token => _token;

  void _handleAuthChanged(User? userData) {
    print("curdata: $userData");
    if (userData != null) {
      // 메인페이지로 이동
      Get.toNamed(MainPage.route);
      return;
    }
    // 로그인페이지로 이동
    Get.toNamed(LoginPage.route);
    return;
  }

  login(String id, String pw) async {
    dio.options.baseUrl = "http://52.79.115.43:8090";
    try {
      var res = await dio.post(
          "http://52.79.115.43:8090${ApiRoutes.authWithPassword}",
          data: {"identity": id, "password": pw});
      if (res.statusCode == 200) {
        // print(res.data["record"]);
        var user = User.fromMap(res.data["record"]);
        _user(user);
        _token = res.data["token"];
        // print("============ _token : $_token");
      }
    } on DioError catch (e) {
      print(e.message);
      print(e.requestOptions.path);
    }
  }

  logout() {
    _user.value = null;
    _user(null);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    ever(_user, _handleAuthChanged);
  }
}

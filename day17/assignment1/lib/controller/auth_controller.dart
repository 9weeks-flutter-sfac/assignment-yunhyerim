// ignore_for_file: unnecessary_string_interpolations, prefer_const_constructors

import 'dart:math';

import 'package:assignment1/view/page/login_page.dart';
import 'package:assignment1/view/page/main_page.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../model/user.dart';

class AuthController extends GetxController {
  final Rxn<User> _user = Rxn();
  RxString? _token = "".obs;
  Dio dio = Dio();

  User? get user => _user.value;
  String? get token => _token?.value;

  //test1@example.com
  //123456789
  //text12345
  //I/flutter ( 6607): ==== STATUS : OK
  // I/flutter ( 6607): {"avatar":"","collectionId":"_pb_users_auth_","collectionName":"users","created":"2023-10-17 06:05:45.366Z","emailVisibility":false,"id":"svxge1xfdwvox5i","name":"","updated":"2023-10-17 06:05:45.366Z","username":"text1","verified":false}

  // 로그인
  login(String id, String pw) async {
    var url =
        "http://52.79.115.43:8090/api/collections/users/auth-with-password";
    try {
      var res = await dio.post(url, data: {
        "identity": id,
        "password": pw,
      });
      // print("========= ${res.data["token"]}");
      // print("========= ${res.data["record"]}");

      _token!(res.data["token"]);
      var user = User.fromMap(res.data["record"]);
      _user(user);

      print("===== set_token : $_token");
      print("===== set_user : $_user");

      Get.toNamed(MainPage.route);
    } catch (e) {
      print(e);
    }
  }

  // 회원가입
  signUp(String email, String pw, String checkedPw, String username) async {
    print("========= SIGN UP");
    String url = "http://52.79.115.43:8090/api/collections/users/records";

    // pw와 pw재입력이 같은지
    if (pw != checkedPw) {
      Get.showSnackbar(GetSnackBar(
        title: "가입 실패",
        message: "비밀번호를 확인해주세요",
        duration: Duration(seconds: 2),
      ));
      return;
    }
    // pw 9자 이상
    if (!_isPasswordLongEnough(pw) && !_isPasswordLongEnough(checkedPw)) {
      Get.showSnackbar(GetSnackBar(
        title: "가입 실패",
        message: "비밀번호는 9자 이상이어야 합니다.",
        duration: Duration(seconds: 2),
      ));
      return;
    }

    // email이 형식에 맞는지
    if (!_isEmailCorrected(email)) {
      Get.showSnackbar(GetSnackBar(
        title: "가입 실패",
        message: "이메일을 확인해주세요",
        duration: Duration(seconds: 2),
      ));
      return;
    }

    try {
      var request = await dio.post(url, data: {
        "email": email,
        "password": pw,
        "passwordConfirm": checkedPw,
        "username": username,
      });
      print("==== STATUS : ${request.statusCode}");
      print("==== STATUS : ${request.statusMessage}");
      print(request);
      Get.toNamed(LoginPage.route);
      Get.showSnackbar(GetSnackBar(
        title: "가입 성공",
        message: "$email",
        duration: Duration(seconds: 4),
      ));
    } on DioError catch (e) {
      print("=== ERROR : ${e.message}");
      print(e);
      Get.showSnackbar(GetSnackBar(
        title: "가입 실패",
        message: "다시 시도해주세요",
        duration: Duration(milliseconds: 2),
      ));
    }
  }

  bool _isEmailCorrected(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(email);
  }

  bool _isPasswordLongEnough(String pw) {
    return RegExp(r'[9,]').hasMatch(pw);
  }

  void logout() {
    _token = null;
    _user(null);
    Get.toNamed(LoginPage.route);
  }
}

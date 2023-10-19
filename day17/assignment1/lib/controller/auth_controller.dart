import 'package:assignment1/controller/main_controller.dart';
import 'package:assignment1/controller/secret_controller.dart';
import 'package:assignment1/controller/sign_up_controller.dart';
import 'package:assignment1/controller/user_list_controller.dart';
import 'package:assignment1/view/page/login_page.dart';
import 'package:assignment1/view/page/main_page.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../model/user.dart';

class AuthController extends GetxController {
  Rxn<User>? _user;
  RxString? _token = "".obs;
  Dio dio = Dio();

  User? get user => _user?.value;
  String? get token => _token?.value;

  // 로그인
  login(String id, String pw) async {
    print("=== authcontroller.login");
    var url =
        "http://52.79.115.43:8090/api/collections/users/auth-with-password";
    try {
      var res = await dio.post(url, data: {
        "identity": id,
        "password": pw,
      });
      // print("========= ${res.data["token"]}");
      // print("========= ${res.data["record"]}");

      _token = RxString(res.data["token"]);

      var user = User.fromMap(res.data["record"]);
      _user = Rxn(user);

      print("===== set_token : $_token");
      print("===== set_user : $_user");

      Get.find<UserListController>().scrollController.onDetach;
      Get.find<SecretController>().scrollController.onAttach;
      Get.find<MainController>().currentIndex.value = 0;

      Get.toNamed(MainPage.route);
      Get.showSnackbar(GetSnackBar(
        title: "로그인 성공",
        message: "$id으로 로그인",
        duration: Duration(milliseconds: 1500),
      ));
    } catch (e) {
      print(e);
      Get.showSnackbar(GetSnackBar(
        title: "로그인 실패",
        message: "다시 시도해주세요",
      ));
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

      Get.toNamed(LoginPage.route);
      Get.showSnackbar(GetSnackBar(
        title: "가입 성공",
        message: "$email",
        duration: Duration(seconds: 4),
      ));

      var signUpController = Get.find<SignUpController>();
      signUpController.emailController.clear();
      signUpController.pwController.clear();
      signUpController.pwCheckController.clear();
      signUpController.usernameController.clear();
    } on DioError catch (e) {
      print("=== ERROR : ${e.message}");
      print(e);
      Get.showSnackbar(GetSnackBar(
        title: "가입 실패",
        message: "다시 시도해주세요",
        duration: Duration(seconds: 2),
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

  //로그아웃
  void logout() {
    print("======= LOGOUT");

    _token = null;
    _user = null;

    print("TOKEN : $_token");
    print("USER : ${_user?.value}");

    // Get.toNamed(LoginPage.route, preventDuplicates: true);
    Get.offAll(() => LoginPage());
    Get.showSnackbar(const GetSnackBar(
      title: "로그아웃 완료",
      message: "다시 로그인 해 주세요",
      duration: Duration(seconds: 2),
    ));
    // Get.find<MainController>().dispose();
    Get.find<UserListController>().scrollController.onDetach;
    Get.find<SecretController>().scrollController.onDetach;
  }
}

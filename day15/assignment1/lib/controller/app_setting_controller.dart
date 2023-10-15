// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';

class AppSettingController extends GetxController {
  // 전역 접근 가능하게 하기 위해 static
  static AppSettingController get to => Get.find();

  bool isSoundOn = true;
  bool isNotificationOn = true;
  String appVersion = "0.0.1";
  String appName = "Coin Counter";
  String appAuthor = "Hyerim";
  String appPackageName = "Assignment1";
  DateTime? lastUpdated;

  AppSettingController({
    required this.isSoundOn,
    required this.isNotificationOn,
    required this.appVersion,
    required this.appName,
    required this.appAuthor,
    required this.appPackageName,
    this.lastUpdated,
  });
}

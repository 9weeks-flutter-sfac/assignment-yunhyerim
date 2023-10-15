import 'dart:async';

import 'package:assignment1/controller/app_setting_controller.dart';
import 'package:assignment1/notification.dart';
import 'package:get/get.dart';

class CoinController extends GetxController {
  RxInt coinNum = 0.obs;
  final passedSeconds = 0.obs;
  bool isStartedTimer = true;
  Timer? _timer;

  void _startTimer(RxInt passedSeconds) {
    print("START TIMER");
    const duration = Duration(seconds: 1);
    _timer = Timer.periodic(duration, (timer) {
      passedSeconds.value++;
      _increaseCoinNum();
      update();
    });
  }

  void _increaseCoinNum() {
    coinNum.value++;
  }

  @override
  void onInit() {
    print("ONINIT");
    super.onInit();
    if (isStartedTimer) {
      return _startTimer(passedSeconds);
    }
  }

  @override
  void onReady() {
    super.onReady();
    ever(coinNum, (value) {
      if (coinNum.value % 10 == 0 && coinNum.value != 0) {
        print("ONREADY : EVER");
        if (AppSettingController.to.isNotificationOn == true) {
          // appsettingcontroller의 알림 설정이 켜져있을때만 작동
          FlutterLocalNotification.showNotification(
              title: "코인 $coinNum 돌파!", body: "축하합니다!");
        }
      }
    });
  }
}

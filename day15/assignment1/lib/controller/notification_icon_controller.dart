import 'package:get/get.dart';

// 알림 onoff icon의 변경 추적을 위한 controller 클래스
class NotificationIconController extends GetxController {
  RxBool isTurnNotificationOn = true.obs;
}

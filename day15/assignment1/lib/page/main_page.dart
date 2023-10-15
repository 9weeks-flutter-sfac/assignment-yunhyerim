import 'package:assignment1/controller/app_setting_controller.dart';
import 'package:assignment1/controller/coin_controller.dart';
import 'package:assignment1/controller/notification_icon_controller.dart';
import 'package:assignment1/page/about_page.dart';
import 'package:assignment1/page/coin_store_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    var coinController = Get.find<CoinController>();
    var iconController = Get.find<NotificationIconController>();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Obx(() => Text(
                  "Current Coin : ${coinController.coinNum.value}",
                  style: TextStyle(fontSize: 24),
                )),
            SizedBox(
              height: 8,
            ),
            Icon(
              FontAwesomeIcons.bitcoin,
              size: 96.0,
              color: Colors.yellow.shade700,
            ),
            TextButton(
                onPressed: () {
                  Get.to(() => CoinStorePage());
                },
                child: Text("상점으로 이동하기")),
            TextButton(
                onPressed: () {
                  Get.to(() => AboutPage());
                },
                child: Text("About")),
            IconButton(
                onPressed: () {
                  AppSettingController.to.isNotificationOn =
                      !AppSettingController.to.isNotificationOn;
                  print(
                      "===== NOTIFICATION STATE ${AppSettingController.to.isNotificationOn}");
                  iconController.isTurnNotificationOn.value =
                      !iconController.isTurnNotificationOn.value;
                },
                icon: Obx(() => Icon(iconController.isTurnNotificationOn.value
                    ? Icons.notifications_off
                    : Icons.notifications_active)))

            // TextButton(
            //     onPressed: () {
            //       FlutterLocalNotification.showNotification();
            //     },
            //     child: Text("테스트 알림 보내기")),
          ],
        ),
      ),
    );
  }
}

import 'package:assignment1/controller/app_setting_controller.dart';
import 'package:assignment1/controller/coin_controller.dart';
import 'package:assignment1/notification.dart';
import 'package:assignment1/page/coin_store_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    var coinController = Get.find<CoinController>();
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Obx(() => Text("${coinController.coinNum.value}")),
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

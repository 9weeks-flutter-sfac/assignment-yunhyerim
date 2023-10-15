import 'package:assignment1/controller/coin_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CoinStorePage extends StatelessWidget {
  const CoinStorePage({super.key});

  @override
  Widget build(BuildContext context) {
    var coinController = Get.find<CoinController>();

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "상점",
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(
              height: 16,
            ),
            Obx(
              () => Text("현재 보유한 코인 : ${coinController.coinNum.value}"),
            ),
            TextButton(
                onPressed: () {
                  coinController.coinNum.value = 0;
                },
                child: Text("코인 리셋"))
          ],
        ),
      ),
    );
  }
}

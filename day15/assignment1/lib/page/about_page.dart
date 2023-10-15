import 'package:assignment1/controller/app_setting_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AboutPage extends GetView<AppSettingController> {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    // var appSettingController = Get.find<AppSettingController>();
    print(controller.lastUpdated);
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${controller.appName}",
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(
              height: 8,
            ),
            Text("Version ${controller.appVersion}"),
            Text("App Author : ${controller.appAuthor}"),
            Text(
                "Last Updated ${DateFormat("y-M-d").format(controller.lastUpdated!)}"),
          ],
        ),
      ),
    );
  }
}

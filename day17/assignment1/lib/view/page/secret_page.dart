import 'package:animate_do/animate_do.dart';
import 'package:assignment1/controller/auth_controller.dart';
import 'package:assignment1/controller/secret_controller.dart';
import 'package:assignment1/controller/secret_upload_controller.dart';
import 'package:assignment1/view/page/login_page.dart';
import 'package:assignment1/view/page/secret_upload_page.dart';
import 'package:assignment1/view/page/widget/secret_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/secret.dart';

class SecretPage extends GetView<SecretController> {
  const SecretPage({super.key});
  static const String route = "/secret";
  // final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {
    var authController = Get.find<AuthController>();
    return Scaffold(
      body: Obx(() {
        if (authController.token != null) {
          return Center(
            child: FutureBuilder(
              future: controller.getSecretList(),
              builder: (context, snapshot) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Obx(
                    () => ListView.builder(
                      controller: controller.scrollController,
                      shrinkWrap: true,
                      itemCount: controller.secretList.length,
                      itemBuilder: (context, index) {
                        Secret secret = controller.secretList[index];
                        return FadeInUp(
                          child: SecretWidget(secret: secret),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          );
        } else {
          Future.delayed(Duration(milliseconds: 1500), () {
            Get.toNamed(LoginPage.route);
          });
        }
        return const CircularProgressIndicator();
      }),
      floatingActionButton: ZoomIn(
        child: FloatingActionButton(
          onPressed: () {
            Get.toNamed(SecretUploadPage.route)
                ?.then((value) => controller.scrollController.jumpTo(0.0));
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.amberAccent.shade400,
        ),
      ),
    );
  }
}

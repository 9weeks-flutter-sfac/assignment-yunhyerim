import 'package:animate_do/animate_do.dart';
import 'package:assignment1/controller/secret_controller.dart';
import 'package:assignment1/controller/secret_upload_controller.dart';
import 'package:assignment1/view/page/secret_upload_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/secret.dart';

class SecretPage extends GetView<SecretController> {
  SecretPage({super.key});
  static const String route = "/secret";
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {
    Get.find<SecretUploadController>();
    return Scaffold(
      body: Center(
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
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              const AssetImage("assets/karaoke.png"),
                          backgroundColor: Colors.grey.withOpacity(0.3),
                          radius: 30,
                        ),
                        title: secret.secret == null
                            ? const Text("No Secret")
                            : Text(secret.secret != ""
                                ? secret.secret!
                                : "비밀이 없습니다."),
                        subtitle: Text(secret.authorName != ""
                            ? secret.authorName!
                            : "익명의 사용자"),
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: ZoomIn(
        child: FloatingActionButton(
          onPressed: () {
            Get.to(SecretUploadPage.route)
                ?.then((value) => controller.scrollController.jumpTo(0.0));
          },
          child: Icon(Icons.add),
          backgroundColor: Colors.amberAccent.shade400,
        ),
      ),
    );
  }
}

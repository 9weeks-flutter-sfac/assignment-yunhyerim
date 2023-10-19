import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:assignment1/controller/secret_upload_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SecretUploadPage extends GetView<SecretUploadController> {
  const SecretUploadPage({super.key});
  static const String route = "/upload";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("비밀 공유하기"),
        backgroundColor: Colors.amberAccent.shade400,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Center(
        child: FadeInUp(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  maxLines: 3,
                  selectionHeightStyle: BoxHeightStyle.strut,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide:
                              BorderSide(color: Colors.amberAccent.shade700)),
                      labelStyle: const TextStyle(color: Colors.black)),
                  controller: controller.postController,
                  style: const TextStyle(color: Colors.black),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 40,
                  width: 400,
                  child: Expanded(
                    child: ElevatedButton(
                      // style: ElevatedButton.styleFrom(minimumSize: Size(350, 40)),
                      onPressed: () {
                        controller.postSecret(controller.postController.text);
                        controller.postController.clear();

                        Get.back();
                        Get.showSnackbar(const GetSnackBar(
                          title: "비밀 공유",
                          message: "성공",
                          duration: Duration(
                            milliseconds: 1500,
                          ),
                        ));
                      },
                      child: Text("비밀 공유하기"),
                      style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Colors.amberAccent.shade400),
                          foregroundColor:
                              const MaterialStatePropertyAll(Colors.black)),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

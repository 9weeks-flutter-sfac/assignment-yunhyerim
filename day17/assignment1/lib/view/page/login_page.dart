import 'package:animate_do/animate_do.dart';
import 'package:assignment1/controller/login_controller.dart';
import 'package:assignment1/view/page/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  static const String route = "/login";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElasticIn(
                child: Image.asset(
                  "assets/pumpkin.png",
                  height: 230,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              TextField(
                controller: controller.idController,
              ),
              TextField(
                controller: controller.pwController,
              ),
              ElevatedButton(
                onPressed: controller.login,
                child: const Text("Login"),
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.amberAccent.shade400),
                    foregroundColor:
                        const MaterialStatePropertyAll(Colors.black)),
              ),
              ElevatedButton(
                onPressed: () => Get.toNamed(SignUpPage.route),
                child: const Text("Sign Up"),
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStatePropertyAll(Colors.amberAccent.shade400),
                  foregroundColor: const MaterialStatePropertyAll(Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

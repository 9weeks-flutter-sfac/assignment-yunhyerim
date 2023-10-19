import 'package:assignment1/controller/sign_up_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends GetView<SignUpController> {
  const SignUpPage({super.key});
  static const String route = "/signup";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("회원가입"),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: controller.emailController,
                decoration: const InputDecoration(hintText: "Email"),
              ),
              TextField(
                controller: controller.pwController,
                decoration: const InputDecoration(hintText: "Password"),
              ),
              TextField(
                controller: controller.pwCheckController,
                decoration: const InputDecoration(hintText: "Password Check"),
              ),
              TextField(
                controller: controller.usernameController,
                decoration: const InputDecoration(hintText: "Username"),
              ),
              const SizedBox(
                height: 8,
              ),
              ElevatedButton(
                onPressed: controller.signUp,
                child: Text("Sign Up"),
                style: ButtonStyle(
                    foregroundColor:
                        const MaterialStatePropertyAll(Colors.black),
                    backgroundColor:
                        MaterialStatePropertyAll(Colors.amberAccent.shade400)),
              )
            ],
          ),
        ),
      ),
    );
  }
}

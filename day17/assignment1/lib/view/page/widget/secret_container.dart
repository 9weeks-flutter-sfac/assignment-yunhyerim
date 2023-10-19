import 'package:assignment1/controller/secret_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../model/secret.dart';

class SecretContainer extends GetView<SecretController> {
  const SecretContainer({super.key, required this.secret});

  final Secret secret;

  @override
  Widget build(BuildContext context) {
    print("container:  ${secret.secret}");
    Secret thisSecret = secret;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("assets/karaoke.png"),
              // : NetworkImage(secretInfo["author"]["avatar"])
              //     as ImageProvider,
              backgroundColor: Colors.grey.withOpacity(0.3),
              radius: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                thisSecret.secret ?? "비밀이 없습니다.",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              thisSecret.authorName ?? "익명",
              // secretInfo["author"] == "익명"
              //     ? secretInfo["author"]
              //     : secretInfo["author"]["name"],
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}

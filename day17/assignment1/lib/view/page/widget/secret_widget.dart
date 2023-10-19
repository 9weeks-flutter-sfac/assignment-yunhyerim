import 'package:assignment1/model/secret.dart';
import 'package:flutter/material.dart';

class SecretWidget extends StatelessWidget {
  const SecretWidget({super.key, required this.secret});

  final Secret secret;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: const AssetImage("assets/karaoke.png"),
        backgroundColor: Colors.grey.withOpacity(0.3),
        radius: 30,
      ),
      title: secret.secret == null
          ? const Text("No Secret")
          : Text(secret.secret != "" ? secret.secret! : "비밀이 없습니다."),
      subtitle: Text(secret.authorName != "" ? secret.authorName! : "익명의 사용자"),
    );
  }
}

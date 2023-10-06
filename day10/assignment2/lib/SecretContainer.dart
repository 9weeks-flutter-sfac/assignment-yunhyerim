import 'package:flutter/material.dart';

class SecretContainer extends StatelessWidget {
  const SecretContainer({super.key, required this.secretInfo});

  final Map<String, dynamic> secretInfo;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            //TODO
            //if else 말고 다른 대안 없는지
            if (secretInfo["author"] == "익명")
              CircleAvatar(
                backgroundImage: AssetImage("assets/karaoke.png"),
                backgroundColor: Colors.grey.withOpacity(0.3),
                radius: 80,
              )
            else
              CircleAvatar(
                backgroundImage: NetworkImage(secretInfo["author"]["avatar"]),
                backgroundColor: Colors.grey.withOpacity(0.3),
                radius: 80,
              ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                secretInfo["secret"],
                textAlign: TextAlign.center,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            Text(
              secretInfo["author"] == "익명"
                  ? secretInfo["author"]
                  : secretInfo["author"]["name"],
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}

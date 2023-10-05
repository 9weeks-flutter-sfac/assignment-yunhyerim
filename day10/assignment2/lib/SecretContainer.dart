import 'package:flutter/material.dart';

class SecretContainer extends StatelessWidget {
  const SecretContainer({super.key, required this.authors});

  final Map<String, dynamic> authors;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(authors["username"]),
          Text(authors["name"]),
          Text(authors["avatar"]),
        ],
      ),
    );
  }
}

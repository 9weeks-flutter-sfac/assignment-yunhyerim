import 'package:flutter/material.dart';

class SecretContainer extends StatelessWidget {
  const SecretContainer({super.key, required this.authors});

  final Map<String, dynamic> authors;

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
            Text(
              authors["username"],
              style: TextStyle(color: Colors.white),
            ),
            Text(
              authors["name"],
              style: TextStyle(color: Colors.white),
            ),
            Text(
              authors["avatar"],
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}

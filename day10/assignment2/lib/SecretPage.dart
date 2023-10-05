import 'package:animate_do/animate_do.dart';
import 'package:assignment2/SecretContainer.dart';
import 'package:flutter/material.dart';
import 'package:secret_cat_sdk/api/api.dart';
import 'package:secret_cat_sdk/model/author.dart';

class SecretPage extends StatefulWidget {
  const SecretPage({super.key});

  @override
  State<SecretPage> createState() => _SecretPageState();
}

class _SecretPageState extends State<SecretPage> {
  List<Map<String, dynamic>> secretList = [];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
        future: SecretCatApi.fetchSecrets(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            for (var secret in snapshot.data!) {
              var secretData = secret.secret;
              Author? author = secret.author;

              if (author == null) {
                secretList.add(
                  {
                    "secret": secretData,
                    "author": "익명",
                  },
                );
              } else {
                secretList.add(
                  {
                    "secret": secretData,
                    "author": {
                      "name": author.name,
                      "username": author.username,
                      "avatar": author.avatar
                    }
                  },
                );
              }
            }
          }

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Expanded(
              child: PageView.builder(
                itemCount: secretList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return FadeInRight(
                    child: SecretContainer(
                      secretInfo: secretList[index],
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}

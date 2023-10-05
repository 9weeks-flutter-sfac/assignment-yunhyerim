import 'package:assignment2/SecretContainer.dart';
import 'package:flutter/material.dart';
import 'package:secret_cat_sdk/api/api.dart';

class SecretPage extends StatefulWidget {
  const SecretPage({super.key});

  @override
  State<SecretPage> createState() => _SecretPageState();
}

class _SecretPageState extends State<SecretPage> {
  var pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder(
        future: SecretCatApi.fetchAuthors(),
        builder: (context, snapshot) {
          List<Map<String, dynamic>> authors = [];

          if (snapshot.connectionState == ConnectionState.done) {
            var dataList = snapshot.data!.toList();
            // print(dataList);

            authors.clear();

            if (authors.isEmpty) {
              for (var author in dataList) {
                String name = author.name;
                String username = author.username;
                String? avatar = author.avatar;

                authors.add(
                  {"name": name, "username": username, "avatar": avatar},
                );
              }
            }

            print("================== AUTHORS : $authors");
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Expanded(
              child: PageView.builder(
                itemCount: authors.length,
                controller: pageController,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return SecretContainer(
                    authors: authors[index],
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

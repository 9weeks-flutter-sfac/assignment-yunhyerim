import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:secret_cat_sdk/api/api.dart';

class AuthorPage extends StatefulWidget {
  const AuthorPage({super.key});

  @override
  State<AuthorPage> createState() => _AuthorPageState();
}

class _AuthorPageState extends State<AuthorPage> {
  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> authors = [];

    return Center(
      child: FutureBuilder(
        future: SecretCatApi.fetchAuthors(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // print("${snapshot.data}");
            for (var author in snapshot.data) {
              String name = author.name;
              String username = author.username;
              String avatar = author.avatar;

              authors.add(
                {"name": name, "username": username, "avatar": avatar},
              );

              // print("=============== AUTHORS : $authors");
            }
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, mainAxisSpacing: 14),
                  itemCount: authors.length,
                  itemBuilder: (context, index) {
                    return FadeInDown(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                            authors[index]["avatar"]!,
                            height: 100,
                            width: 100,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            authors[index]["name"]!,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

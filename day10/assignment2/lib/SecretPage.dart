import 'package:flutter/material.dart';
import 'package:secret_cat_sdk/api/api.dart';
import 'package:secret_cat_sdk/model/author.dart';

class SecretPage extends StatefulWidget {
  const SecretPage({super.key});

  @override
  State<SecretPage> createState() => _SecretPageState();
}

class _SecretPageState extends State<SecretPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            FutureBuilder(
              future: SecretCatApi.fetchAuthors(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  var dataList = snapshot.data!.toList();
                  print(dataList);
                  List<Map<String, dynamic>> authors = [];

                  for (var author in dataList) {
                    String name = author.name;
                    String username = author.username;
                    String? avatar = author.avatar;

                    authors.add(
                        {"name": name, "username": username, "avatar": avatar});
                  }

                  print("================== AUTHORS : $authors");

                  return Text(
                    snapshot.data!.first.toString(),
                    style: TextStyle(color: Colors.white),
                  );
                }
                return SizedBox();
              },
            ),
            Text(
              "비밀보기 페이지입니다.",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
    // return PageView.builder(itemBuilder: (context, index) {

    // },);
  }
}

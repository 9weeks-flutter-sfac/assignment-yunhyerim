import 'dart:ui';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:secret_cat_sdk/api/api.dart';

class UploadPage extends StatefulWidget {
  const UploadPage({super.key});

  @override
  State<UploadPage> createState() => _UploadPageState();
}

class _UploadPageState extends State<UploadPage> {
  var textEditingController = TextEditingController(text: "비밀을 입력하세요");

  void inputSecret(String value) async {
    await SecretCatApi.addSecret(value);

    var secrets = await SecretCatApi.fetchSecrets();

    print(secrets);
  }

  @override
  Widget build(BuildContext context) {
    var snackBar = SnackBar(
      content: Text('비밀을 공유했습니다.'),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {},
      ),
      duration: Duration(milliseconds: 1000),
    );

    return Center(
      child: FadeInUp(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                selectionHeightStyle: BoxHeightStyle.strut,
                decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.blue)),
                    labelStyle: TextStyle(color: Colors.white)),
                controller: textEditingController,
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 40,
                width: 400,
                child: Expanded(
                  child: ElevatedButton(
                      // style: ElevatedButton.styleFrom(minimumSize: Size(350, 40)),
                      onPressed: () {
                        setState(() {
                          inputSecret(textEditingController.text);
                          textEditingController.clear();
                        });
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      child: Text("비밀 공유")),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

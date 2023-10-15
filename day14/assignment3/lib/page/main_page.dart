// 추가 코드를 작성할 것. 본 소스는 디자인만 작성되어 있으며
// 이 기본 틀을 통하여 과제에 필요한 소스코드를 추가적으로 구현할 것.
// ignore_for_file: avoid_print, prefer_const_constructors

import 'package:assignment3/model/dict.dart';
import 'package:assignment3/widget/dict_card.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Dio dio = Dio();
  Dict? dict;

  var controller = TextEditingController();

  void getDictData(String value) async {
    String url = "https://api.dictionaryapi.dev/api/v2/entries/en/$value";
    try {
      var response = await dio.get(url);
      // print(response.data.runtimeType); //List<dynamic>

      dict = Dict.fromMap(response.data[0]);

      print("============ DICT = ${dict}");

      setState(() {});
    } catch (e) {
      dict = null;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    // getDictData("pioneer");
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dictionary App'),
        elevation: 0,
        centerTitle: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: TextField(
                      controller: controller,
                      decoration: const InputDecoration(
                        hintText: "Search",
                        suffixIcon: Icon(Icons.search),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                        ),
                      ),
                      onSubmitted: (value) {
                        getDictData(value);
                        print("============= $value");
                        setState(() {});
                      },
                    ),
                  ),
                ),
              ],
            ),
            Divider(),
            if (dict != null)
              Expanded(
                child: SingleChildScrollView(
                  child: DictCard(dict: dict!),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

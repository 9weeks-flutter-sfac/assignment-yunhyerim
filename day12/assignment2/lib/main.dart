import 'package:assignment2/json_data.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(const MyApp());
}

Dio dio = Dio();
String url = "https://sniperfactory.com/sfac/http_json_data";
List<JsonData> dataList = [];

void getData() async {
  var res = await dio.get(url);
  print(res.data["item"]);
  JsonData tempData = JsonData.fromMap(res.data["item"]);
  print("TEMPDATA = $tempData");

  dataList.add(tempData);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    getData();

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: FutureBuilder(
            future: Future.delayed(Duration(seconds: 1)),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                getData();
                return ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    // alignment: Alignment.topCenter,
                    width: 200,
                    height: 330,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      // borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurStyle: BlurStyle.normal,
                          spreadRadius: 32,
                        )
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Image.network(
                          dataList[0].image,
                          fit: BoxFit.cover,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                dataList[0].name,
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                dataList[0].description,
                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  "${dataList[0].price}원 결제하고 등록",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}

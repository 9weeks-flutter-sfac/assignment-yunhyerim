import 'dart:math';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shimmer/shimmer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var url = "https://sniperfactory.com/sfac/http_day16_dogs";
  var dio = Dio();
  // var result = "";
  var isCheckingNetwork = false; //연결 확인 중인지
  var isConnectedNetwork = true; //연결됐는지
  var isLoading = false; //로딩 중인지
  var refreshController = RefreshController();

  Map<String, dynamic> data = {};

  List<String> msgList = [];
  List<String> urlList = [];

  bool connectionStatus = false;

  void getData() async {
    Response res = await dio.get(url);

    data = res.data;

    // print(data["body"]);

    if (msgList.isEmpty && urlList.isEmpty) {
      for (var i = 0; i < data["body"].length; i++) {
        print("====== i는 $i");

        msgList.add(data["body"][i]["msg"]);
        urlList.add(data["body"][i]["url"]);
      }

      // print("============== MSGLIST = $msgList");
      // print("=============== URLLIST = $urlList");
      // print("============msglist.length = ${msgList.length}");
    }
  }

  @override
  void initState() {
    super.initState();

    getData();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("8일차 과제"),
          centerTitle: true,
        ),
        body: SafeArea(
          child: !isCheckingNetwork && isConnectedNetwork
              ? FutureBuilder(
                  future: Future.delayed(Duration(seconds: 2)),
                  builder: (context, snapshot) {
                    return SmartRefresher(
                      controller: refreshController,
                      onRefresh: () async {
                        setState(() {
                          isLoading = true;
                        });
                        getData();
                        await Future.delayed(Duration(seconds: 1));

                        print("새로고침 중...");
                        setState(() {
                          isLoading = false;
                          print("====== $isLoading");
                          refreshController.refreshCompleted();
                        });
                      },
                      child: GridView.builder(
                        shrinkWrap: true,
                        itemCount: msgList.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.78,
                          mainAxisSpacing: 7,
                          crossAxisSpacing: 7,
                        ),
                        itemBuilder: (context, index) {
                          String msg = msgList[index];
                          String imgUrl = urlList[index];

                          return !isLoading
                              ? Container(
                                  width: 100,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Container(
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          child: SizedBox(
                                            width: 173,
                                            height: 173,
                                            child: Image.network(
                                              imgUrl,
                                              fit: BoxFit.fitWidth,
                                            ),
                                          ),
                                        ),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                width: 0.7, color: Colors.grey),
                                            borderRadius:
                                                BorderRadius.circular(16)),
                                      ),
                                      SizedBox(height: 6),
                                      Text(msg),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8),
                                            child: Icon(Icons.comment),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey,
                                          blurRadius: 3,
                                          blurStyle: BlurStyle.outer),
                                    ],
                                  ),
                                )
                              : Shimmer.fromColors(
                                  baseColor: Colors.grey[300]!,
                                  highlightColor: Colors.grey[100]!,
                                  child: Card(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(16)),
                                  ),
                                );
                        },
                      ),
                    );
                  },
                )
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (isCheckingNetwork) Text('인터넷 연결 확인 중 입니다.'),
                      if (!isConnectedNetwork) Text('NO INTERNET'),
                      SizedBox(
                        height: 10,
                      ),
                      if (isCheckingNetwork) CircularProgressIndicator(),
                    ],
                  ),
                ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            setState(() {
              isCheckingNetwork = true;
            });
            print("======= $isCheckingNetwork");
            await Connectivity().checkConnectivity();
            await Future.delayed(Duration(seconds: 1));

            print("===== CHECKING NETWORK");

            if (ConnectivityResult == ConnectivityResult.none) {
              setState(() {
                isConnectedNetwork = false;
              });
            } else {
              print("======= $isConnectedNetwork");
              setState(() {
                isConnectedNetwork = true;
              });
            }
            setState(() {
              isCheckingNetwork = false;
              isLoading = true;
            });
            await Future.delayed(Duration(milliseconds: 1500));
            setState(() {
              isLoading = false;
            });
          },
          child: Icon(Icons.wifi_find_rounded),
        ),
      ),
    );
  }
}

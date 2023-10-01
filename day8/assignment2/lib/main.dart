import 'package:assignment2/CardContainer.dart';
import 'package:assignment2/NetworkCheckingScreen.dart';
import 'package:assignment2/ShimmerCard.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

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
    setState(() {
      isLoading = true;
    });
    await Future.delayed(Duration(milliseconds: 1500));
    Response res = await dio.get(url);
    data = res.data;
    // print(data["body"]);

    if (msgList.isEmpty && urlList.isEmpty) {
      for (var i = 0; i < data["body"].length; i++) {
        msgList.add(data["body"][i]["msg"]);
        urlList.add(data["body"][i]["url"]);
      }
      // print("============== MSGLIST = $msgList");
      // print("=============== URLLIST = $urlList");
      // print("============msglist.length = ${msgList.length}");
    }
    setState(() {
      isLoading = false;
    });

    print("============== IS LOADING = $isLoading");
  }

  // 새로고침
  void onRefresh() {
    print("새로고침 중...");
    getData();

    setState(() {
      refreshController.refreshCompleted();
    });
  }

  // 인터넷 연결 확인
  void checkNetwork() async {
    setState(() {
      isCheckingNetwork = true;
    });

    var connectivityResult = await Connectivity().checkConnectivity();
    await Future.delayed(Duration(milliseconds: 1500));

    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.ethernet) {
      isConnectedNetwork = true;
    } else {
      isConnectedNetwork = false;
    }

    isCheckingNetwork = false;

    // 연결이 확인되면 화면 로딩 시작
    isLoading = true;
    setState(() {});

    await Future.delayed(Duration(milliseconds: 1500));
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();

    getData();
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
                        onRefresh: onRefresh,
                        child: GridView.builder(
                          shrinkWrap: true,
                          itemCount: msgList.length,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.78,
                            mainAxisSpacing: 7,
                            crossAxisSpacing: 7,
                          ),
                          itemBuilder: (context, index) {
                            String msg = msgList[index];
                            String imgUrl = urlList[index];

                            return !isLoading
                                ? CardContainer(imgUrl: imgUrl, msg: msg)
                                : ShimmerCard();
                          },
                        ),
                      );
                    },
                  )
                : NetworkCheckingScreen(
                    isCheckingNetwork: isCheckingNetwork,
                    isConnectedNetwork: isConnectedNetwork)),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            checkNetwork();
          },
          child: Icon(Icons.wifi_find_rounded),
        ),
      ),
    );
  }
}

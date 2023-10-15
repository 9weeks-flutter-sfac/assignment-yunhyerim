import 'package:assignment3/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class FirstScreen extends StatefulWidget {
  const FirstScreen({super.key, required this.imageUrl});

  final List<String> imageUrl;

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  var refreshController = RefreshController();
  var currentIdx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('7일차 과제 1번'),
      ),
      body: SmartRefresher(
        controller: refreshController,
        onRefresh: () {
          setState(() {
            if (currentIdx < imageUrl.length - 1) {
              currentIdx += 1;
            } else {
              currentIdx = 0;
            }

            refreshController.refreshCompleted();
          });
        },
        header: WaterDropHeader(),
        child: Center(
          child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.network(imageUrl[currentIdx])),
        ),
      ),
    );
  }
}

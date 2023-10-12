// ignore_for_file: prefer_const_constructors, avoid_print

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:assignment1/widget/filter_bottom_sheet.dart';
import 'package:assignment1/widget/todo_cart.dart';
import 'package:dio/dio.dart';
import 'model/todo.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Todo> todos = [];
  Dio dio = Dio();
  String url = "https://jsonplaceholder.typicode.com/todos";
  TodoFilter todoFilter = TodoFilter.all; // 필터 초기값

  getTodoData() async {
    var resp = await dio.get(url);
    // print(resp.data); //List<dynamic>
    if (resp.statusCode == 200) {
      var data = List<Map<String, dynamic>>.from(resp.data);
      setState(() {
        todos = data.map((e) => Todo.fromMap(e)).toList();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getTodoData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text("Todo App"),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0,
        //appbar 뒤의 위젯
        flexibleSpace:
            //ClipRect: appbar 영역까지만 blur가 되게 자름
            ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              //elevation같은것 높을수록 blur가 강해짐
              sigmaX: 10,
              sigmaY: 10,
            ),
            child: Container(),
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.filter_alt),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => FilterBottomSheet(
                  filter: todoFilter,
                  onApply: (value) {
                    print(value);
                    setState(() => todoFilter = value);
                  },
                ),
              );
            },
          ),
          IconButton(
              onPressed: () {
                getTodoData();
              },
              icon: Icon(Icons.refresh))
        ],
      ),
      body: ListView.builder(
        itemCount: filterMaker(todos).length,
        itemBuilder: (context, index) => TodoCard(
          todo: filterMaker(todos)[index],
        ),
      ),
    );
  }

  List<Todo> filterMaker(List<Todo> value) {
    switch (todoFilter) {
      case TodoFilter.all:
        return value;
      case TodoFilter.completed:
        return value.where((element) => element.completed == true).toList();
      case TodoFilter.incompleted:
        return value.where((element) => element.completed == false).toList();
    }
  }
}

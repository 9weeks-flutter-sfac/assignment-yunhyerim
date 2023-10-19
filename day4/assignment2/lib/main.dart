import 'package:assignment2/MenuContainer.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> orderList = [];

  @override
  Widget build(BuildContext context) {
    var kioskApp = MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            '분식왕 이테디 주문하기',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          elevation: 0, //appbar 그림자 없애기
          centerTitle: true, //android는 기본이 타이틀 왼쪽
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView(
            children: [
              Text(
                '주문 리스트',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
              ),
              Text(orderList.toString()),
              SizedBox(
                height: 10,
              ),
              Text(
                '음식',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: MenuContainer(
                      imgUrl: 'assets/option_beer.png',
                      menuName: '맥주',
                    ),
                    onTap: () {
                      setState(() {
                        orderList.add('맥주');
                      });
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    child: MenuContainer(
                      imgUrl: 'assets/option_bokki.png',
                      menuName: '떡볶이',
                    ),
                    onTap: () {
                      setState(() {
                        orderList.add('떡볶이');
                      });
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    child: MenuContainer(
                      imgUrl: 'assets/option_kimbap.png',
                      menuName: '김밥',
                    ),
                    onTap: () {
                      setState(() {
                        orderList.add('김밥');
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    child: MenuContainer(
                      imgUrl: 'assets/option_omurice.png',
                      menuName: '오므라이스',
                    ),
                    onTap: () {
                      setState(() {
                        orderList.add('오므라이스');
                      });
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    child: MenuContainer(
                      imgUrl: 'assets/option_pork_cutlets.png',
                      menuName: '돈까스',
                    ),
                    onTap: () {
                      setState(() {
                        orderList.add('돈까스');
                      });
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    child: MenuContainer(
                      imgUrl: 'assets/option_ramen.png',
                      menuName: '라면',
                    ),
                    onTap: () {
                      setState(() {
                        orderList.add('라면');
                      });
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  GestureDetector(
                    child: MenuContainer(
                        imgUrl: 'assets/option_udon.png', menuName: '우동'),
                    onTap: () {
                      setState(() {
                        orderList.add('우동');
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            setState(() {
              orderList.clear();
            });
          },
          label: Text('초기화하기'),
        ),
        //버튼 center로
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
    return kioskApp;
  }
}

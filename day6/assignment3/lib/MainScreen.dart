// import 'package:assignment2/MenuList.dart';
import 'package:assignment2/AdminScreen.dart';
import 'package:flutter/material.dart';

import 'MenuContainer.dart';

class MainScreen extends StatefulWidget {
  MainScreen({
    super.key,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<String> orderList = [];
  var _visible = false;

  @override
  Widget build(BuildContext context) {
    var menuInfo = [
      ['맥주', 'assets/option_beer.png'],
      ['떡볶이', 'assets/option_bokki.png'],
      ['김밥', 'assets/option_kimbap.png'],
      ['오므라이스', 'assets/option_omurice.png'],
      ['돈까스', 'assets/option_pork_cutlets.png'],
      ['라면', 'assets/option_ramen.png'],
      ['우동', 'assets/option_udon.png'],
    ];

    return Scaffold(
      appBar: AppBar(
        title: GestureDetector(
          child: Text(
            '분식왕 이테디 주문하기',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          onDoubleTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AdminScreen(),
              ),
            );
          },
        ),
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        elevation: 0, //appbar 그림자 없애기
        centerTitle: true, //android는 기본이 타이틀 왼쪽
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '주문 리스트',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              Container(
                height: 70,
                child: ListView(
                  shrinkWrap: true, //리스트 자식 높이 크기의 합 만큼 영역 고정
                  scrollDirection: Axis.horizontal,
                  children: orderList
                      .map(
                        (e) => Container(
                          child: Chip(
                            label: Text(e),
                            onDeleted: () {
                              orderList.remove(e);
                              if (orderList.isEmpty) {
                                _visible = false;
                              }
                              setState(() {});
                            },
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
              SizedBox(height: 5),
              Text(
                '음식',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              SizedBox(height: 10),
              //메뉴리스트
              GridView.builder(
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10),
                itemBuilder: (context, index) {
                  var imgUrl = menuInfo[index][1];
                  var menuName = menuInfo[index][0];

                  return GestureDetector(
                    child: MenuContainer(
                      imgUrl: imgUrl,
                      menuName: menuName,
                    ),
                    onTap: () {
                      orderList.add(menuName);
                      _visible = true;
                      setState(() {});
                    },
                  );
                },
                itemCount: menuInfo.length,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Visibility(
        visible: _visible,
        child: FloatingActionButton.extended(
          onPressed: () {},
          label: Text('결제하기'),
        ),
      ),
      //버튼 center로
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

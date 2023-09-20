import 'package:assignment1/DrinkTile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var starbucksApp = MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: false,
          leading: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.search,
                color: Colors.black,
              ),
            )
          ],
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 8, 0, 5),
              child: Text(
                'NEW',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            DrinkTile(
              menuName: '골든 미모사 그린 티',
              menuEnglishName: 'Golden Mimosa Green Tea',
              price: '6100',
              imgUrl: 'assets/images/item_drink1.jpeg',
            ),
            DrinkTile(
              menuName: '블랙 햅쌀 고봉 라떼',
              menuEnglishName: 'Black Rice Latte',
              price: '6300',
              imgUrl: 'assets/images/item_drink2.jpeg',
            ),
            DrinkTile(
              menuName: '아이스 블랙 햅쌀 고봉 라떼',
              menuEnglishName: 'Iced Black Rice Latte',
              price: '6300',
              imgUrl: 'assets/images/item_drink3.jpeg',
            ),
            DrinkTile(
              menuName: '스타벅스 튜메릭 라떼',
              menuEnglishName: 'Starbucks Turmeric Latte',
              price: '6300',
              imgUrl: 'assets/images/item_drink4.jpeg',
            ),
            DrinkTile(
              menuName: '아이스 스타벅스 튜메릭 라떼',
              menuEnglishName: 'Iced Starbucks Turmeric Latte',
              price: '6300',
              imgUrl: 'assets/images/item_drink5.jpeg',
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType
              .fixed, //bottomnavigationbar 3개 이상이면 모양이 바뀌는데 이것을 고정시켜야함.
          currentIndex: 2, //현재 위치한 하단바 메뉴 아이콘 선택 임시.
          fixedColor: Colors.green, //선택한 아이콘 색
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.card_giftcard),
              label: 'Pay',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.coffee),
              label: 'Order',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shop),
              label: 'Shop',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.more_horiz),
              label: 'Other',
            ),
          ],
        ),
        bottomSheet: Container(
          height: 64,
          color: Colors.black87,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16), //양옆 수평 띄우기
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween, //children 위젯들 사이 띄우기
              children: [
                Text(
                  '주문할 매장을 선택해 주세요.',
                  style: TextStyle(color: Colors.white),
                ),
                // Spacer(), //띄우기, 외에 Expanded 사용가능
                Icon(Icons.expand_more, color: Colors.white),
              ],
            ),
          ),
        ),
      ),
    );

    return starbucksApp;
  }
}

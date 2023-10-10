import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'AdminScreen.dart';
import 'MenuContainer.dart';

class MainScreen extends StatefulWidget {
  MainScreen({
    super.key,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  SharedPreferences? prefs;
  List<String> orderList = [];
  var _visible = false;
  Dio dio = Dio();
  String url = "http://52.79.115.43:8090/api/collections/options/records";

  Future<List<dynamic>> getdata() async {
    var res = await dio.get(url);
    if (res.statusCode == 200) {
      return res.data["items"];
    }
    return [];
  }

  @override
  void initState() {
    super.initState();
    initPreferences();
  }

  initPreferences() async {
    prefs = await SharedPreferences.getInstance();
    if (prefs != null) {
      var stringList = prefs!.getStringList("orderList");
      orderList = stringList ?? []; //stringlist가 있으면 orderlist로 null이면 빈 리스트
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    print("ORDERLIST = $orderList");

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
                child: orderList.isEmpty
                    ? Text("담은 메뉴가 없습니다.")
                    : Wrap(
                        children: orderList
                            .map(
                              (e) => Chip(
                                label: Text(e),
                                onDeleted: () {
                                  orderList.remove(e);
                                  if (orderList.isEmpty) {
                                    _visible = false;
                                  }
                                  setState(() {});
                                },
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
              FutureBuilder(
                future: getdata(),
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    print(snapshot.data[0]);
                    return GridView.builder(
                      itemCount: snapshot.data?.length ?? 0,
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 1,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10),
                      itemBuilder: (context, index) {
                        String menuName = snapshot.data![index]["menu"];

                        return GestureDetector(
                          child: MenuContainer(
                              imgUrl: snapshot.data![index]["imageUrl"],
                              menuName: menuName,
                              onTap: () {
                                setState(() {
                                  orderList.add(menuName);
                                  // print("$menuName 추가됨");

                                  if (prefs != null) {
                                    prefs!
                                        .setStringList('orderList', orderList);
                                    // print(
                                    //     "PREFS = ${prefs?.getStringList('orderList')}");
                                  }

                                  _visible = true;
                                });
                              }),
                        );
                      },
                    );
                  }
                  return CircularProgressIndicator();
                },
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

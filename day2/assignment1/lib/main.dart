import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var assignment = MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center, //column 수직 중앙 정렬
              children: [
                //section 1
                Container(
                  // alignment: Alignment.center,
                  // margin: EdgeInsets.all(100),
                  width: double.infinity,
                  height: 100,
                  child: Column(
                    children: [
                      const Text(
                        '오늘 하루는',
                        style: TextStyle(
                            fontSize: 35, fontWeight: FontWeight.bold),
                      ),
                      const Text(
                        '어땠나요?',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
                //section 2
                SizedBox(
                  width: 300,
                  height: 200,
                  child: PageView(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          '우울함',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          gradient: LinearGradient(
                            colors: [
                              Colors.black,
                              Colors.white,
                            ],
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          '상쾌함',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          gradient: LinearGradient(
                            colors: [
                              Colors.blue,
                              Colors.green,
                            ],
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          '행복함',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          gradient: LinearGradient(
                            colors: [
                              Colors.orange,
                              Colors.yellowAccent,
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(),
                //section 3
                Container(
                  width: double.infinity,
                  height: 100,
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),

                  // child: ListTile(
                  //   title: Text(
                  //     '라이언',
                  //     style: TextStyle(
                  //       fontSize: 23,
                  //       fontWeight: FontWeight.w300,
                  //       color: Colors.white,
                  //     ),
                  //   ),
                  //   subtitle: Text(
                  //     '게임개발\nC#, Unity',
                  //     style: TextStyle(
                  //       fontSize: 17,
                  //       color: Colors.white,
                  //     ),
                  //   ),
                  //   leading: CircleAvatar(
                  //     backgroundImage:
                  //         NetworkImage('https://picsum.photos/100/100'),
                  //   ),
                  //   trailing: Icon(
                  //     Icons.add,
                  //   ),
                  // ),
                  child: Row(
                    children: [
                      //프로필 사진
                      Container(
                        width: 70,
                        height: double.infinity,
                        margin: EdgeInsets.fromLTRB(5, 8, 15, 8),
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(
                            'https://picsum.photos/100/100',
                          ),
                          radius: 37,
                        ),
                        // decoration: BoxDecoration(
                        //   border: Border.all(
                        //     style: BorderStyle.solid,
                        //   ),
                        // ),
                      ),
                      //이름 및 소속
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment:
                            MainAxisAlignment.center, //column 수직 중앙 정렬
                        children: [
                          Text(
                            '라이언',
                            style: TextStyle(
                              fontSize: 23,
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            '게임개발',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                            ),
                          ),
                          Text(
                            'C#, Unity',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: 170,
                        alignment: Alignment.centerRight,
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                        ),
                        // decoration: BoxDecoration(
                        //   border: Border.all(
                        //     style: BorderStyle.solid,
                        //   ),
                        // ),
                      ),
                    ],
                  ),

                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    return assignment;
  }
}

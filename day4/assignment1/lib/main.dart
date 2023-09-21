import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key, this.x, this.y});

  var x;
  var y;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var simpleCalculator = MaterialApp(
      home: Builder(builder: (context) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              '사칙연산',
              style: TextStyle(fontWeight: FontWeight.normal),
            ),
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white,
            centerTitle: true, //android는 기본이 타이틀 왼쪽
            shape: Border(top: BorderSide(color: Colors.black)),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('x의 값은?'),
                    SizedBox(width: 30),
                    SizedBox(
                      width: 150,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          x = value;
                          print("x는 $x");
                        },
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black38),
                          ),
                          label: Text('y값을 입력하세요.'),
                          labelStyle: TextStyle(color: Colors.black12),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('y의 값은?'),
                    SizedBox(width: 30),
                    SizedBox(
                      width: 150,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          y = value;
                          print(y);
                        },
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.black38),
                          ),
                          label: Text('y값을 입력하세요.'),
                          labelStyle: TextStyle(color: Colors.black12),
                        ),
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                    onPressed: () {
                      print('x는 $x');
                      print('y는 $y');

                      int result = stringToInt();

                      showResultDialog(context, result);
                    },
                    child: Text('더하기의 결과값은?!')),
                ElevatedButton(onPressed: () {}, child: Text('곱하기의 결과값은?!')),
                ElevatedButton(onPressed: () {}, child: Text('빼기의 결과값은?!')),
                ElevatedButton(onPressed: () {}, child: Text('나누기의 결과값은?!')),
              ],
            ),
          ),
        );
      }),
    );

    return simpleCalculator;
  }

  int stringToInt() {
    var intX = int.parse(x);
    var intY = int.parse(y);

    return intX + intY;
  }

  void showResultDialog(BuildContext context, result) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          child: SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            height: 150,
            child: Center(
              child: Text(
                "$result",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        );
      },
    );
  }
}

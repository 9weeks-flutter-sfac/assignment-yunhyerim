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

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

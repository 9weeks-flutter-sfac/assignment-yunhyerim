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
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  // MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, //기본적으로 true라 따로 만들어주지않아도 뒤로가기 가능
        title: Text('5일차 과제'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SecondPage(),
                    ),
                  );
                },
                child: Text('2번 과제'),
              ),
              SizedBox(
                height: 150,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ThirdPage(),
                    ),
                  );
                },
                child: Text('3번 과제'),
              ),
              SizedBox(
                height: 150,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FourthPage(),
                    ),
                  );
                },
                child: Text('4번 과제'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _scrollController = ScrollController();
    List<String> animalList = ['강아지', '고양이', '앵무새', '토끼', '오리', '거위', '원숭이'];

    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false, //기본적으로 true라 따로 만들어주지않아도 뒤로가기 가능
        title: Text('5일차 과제'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: ListView.builder(
            controller: _scrollController,
            itemCount: animalList.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                height: 300,
                alignment: Alignment.center,
                child: Text(
                  animalList[index],
                  style: TextStyle(color: Colors.black),
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_scrollController.hasClients) {
            final position = _scrollController.position.minScrollExtent;
            _scrollController.animateTo(position,
                duration: Duration(seconds: 1), curve: Curves.easeOut);
          }
        },
        child: Icon(Icons.vertical_align_top),
      ),
    );
  }
}

class ThirdPage extends StatefulWidget {
  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  var textEditingController = TextEditingController();
  var text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   // automaticallyImplyLeading: false, //기본적으로 true라 따로 만들어주지않아도 뒤로가기 가능
      //   title: Text('5일차 과제'),
      //   centerTitle: true,
      // ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              TextField(
                controller: textEditingController,
                decoration: InputDecoration(label: Text('입력')),
                onChanged: (value) {
                  text = value;
                  setState(() {});
                },
              ),
              Text('$text'),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          textEditingController.clear();
          text = '';
          setState(() {});
        },
        child: Icon(Icons.close),
      ),
    );
  }
}

class FourthPage extends StatefulWidget {
  @override
  State<FourthPage> createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
  var isColoredSun = true;
  var isColoredMoon = true;
  var isColoredStar = true;

  var textInputController = TextEditingController();
  var seletedIcon = '';

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false, //기본적으로 true라 따로 만들어주지않아도 뒤로가기 가능
        title: Text('5일차 과제'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          children: [
            ListTile(
              leading: Icon(Icons.sunny,
                  color: isColoredSun ? Colors.grey : Colors.red),
              title: Text('Sun'),
              trailing: IconButton(
                icon: Icon(Icons.arrow_right),
                onPressed: () {
                  isColoredSun = !isColoredSun;
                  setState(() {});
                },
              ),
            ),
            ListTile(
              leading: Icon(Icons.nightlight,
                  color: isColoredMoon ? Colors.grey : Colors.yellow),
              title: Text('Moon'),
              trailing: IconButton(
                icon: Icon(Icons.arrow_right),
                onPressed: () {
                  isColoredMoon = !isColoredMoon;
                  setState(() {});
                },
              ),
            ),
            ListTile(
              leading: Icon(Icons.star,
                  color: isColoredStar ? Colors.grey : Colors.yellow),
              title: Text('Star'),
              trailing: IconButton(
                icon: Icon(Icons.arrow_right),
                onPressed: () {
                  isColoredStar = !isColoredStar;
                  setState(() {});
                },
              ),
            ),
            TextField(
              controller: textInputController,
              onSubmitted: (value) {
                seletedIcon = value;
                setState(() {});

                if (seletedIcon == '태양') {
                  isColoredSun = !isColoredSun;
                }
                if (seletedIcon == '달') {
                  isColoredMoon = !isColoredMoon;
                }
                if (seletedIcon == '별') {
                  isColoredMoon = !isColoredMoon;
                }
              },
              decoration: InputDecoration(label: Text('켜고 끄고 싶은 아이콘을 선택하세요')),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          isColoredSun = true;
          isColoredMoon = true;
          isColoredStar = true;
          setState(() {});
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}

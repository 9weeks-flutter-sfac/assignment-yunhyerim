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
        // foregroundColor: Colors.black,
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

class SecondPage extends StatefulWidget {
  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
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
        child: Center(
          child: Text('2nd Page'),
        ),
      ),
    );
  }
}

class ThirdPage extends StatefulWidget {
  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
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
        child: Center(
          child: Text('3rd Page'),
        ),
      ),
    );
  }
}

class FourthPage extends StatefulWidget {
  @override
  State<FourthPage> createState() => _FourthPageState();
}

class _FourthPageState extends State<FourthPage> {
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
        child: Center(
          child: Text('4th Page'),
        ),
      ),
    );
  }
}

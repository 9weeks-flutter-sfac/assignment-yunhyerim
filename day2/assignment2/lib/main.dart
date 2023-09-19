import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var paddingWidgetPrac = MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              ListTile(
                title: Text('이테디'),
                subtitle: Text('010-1000-2000'),
                leading: Padding(
                  //Padding으로 아이콘만 간격을 띄워줄 수 있다.
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://picsum.photos/100/100',
                    ),
                  ),
                ),
                trailing: Icon(Icons.call),
              ),
              ListTile(
                title: Text('김스틴'),
                subtitle: Text('010-9000-8000'),
                leading: Padding(
                  //Padding으로 아이콘만 간격을 띄워줄 수 있다.
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://picsum.photos/100/100',
                    ),
                  ),
                ),
                trailing: Icon(Icons.call),
              ),
              ListTile(
                title: Text('이주노'),
                subtitle: Text('010-3000-3000'),
                leading: Padding(
                  //Padding으로 아이콘만 간격을 띄워줄 수 있다.
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://picsum.photos/100/100',
                    ),
                  ),
                ),
                trailing: Icon(Icons.call),
              ),
              ListTile(
                title: Text('임헬렌'),
                subtitle: Text('010-2000-8000'),
                leading: Padding(
                  //Padding으로 아이콘만 간격을 띄워줄 수 있다.
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://picsum.photos/100/100',
                    ),
                  ),
                ),
                trailing: Icon(Icons.call),
              ),
              ListTile(
                title: Text('염해리'),
                subtitle: Text('010-1000-1000'),
                leading: Padding(
                  //Padding으로 아이콘만 간격을 띄워줄 수 있다.
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://picsum.photos/100/100',
                    ),
                  ),
                ),
                trailing: Icon(Icons.call),
              ),
            ],
          ),
        ),
      ),
    );

    return paddingWidgetPrac;
  }
}

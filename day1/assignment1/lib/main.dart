import 'package:flutter/material.dart';
// ignore_for_file: prefer_const_constructors

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    String st1 =
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit.\nSed in hendrerit metus.\nNunc consectetur, justo eu tempor tristique, odio mi suscipit lectus, non consequat tellus risus ac sapien.\n";
    String st2 =
        "Fusce at ultricies sapien, ut tincidunt ligula.\nVestibulum non ligula ut purus ullamcorper dignissim in a enim.\n";
    String st3 =
        "Nullam sed odio vel urna auctor lobortis a in odio.\nCras maximus nulla vitae arcu interdum feugiat.\nMaecenas non risus eu libero hendrerit rhoncus at et elit.\nNam nec justo a mi viverra iaculis sed vel justo. Vestibulum dapibus, nulla at fermentum laoreet, libero velit euismod nunc, a facilisis turpis metus vel justo.\n";
    String st4 =
        "Pellentesque facilisis consectetur arcu, nec fermentum purus malesuada a.\nSed mattis, tortor eget commodo bibendum, ante leo convallis purus, at volutpat ante orci non purus.\nInteger ac massa lacinia, gravida odio eu, finibus arcu.\nNullam rhoncus purus at lectus feugiat, ac euismod dui fermentum. Vivamus bibendum sem ut vestibulum.";

    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              children: [
                TextSpan(text: st1, style: TextStyle(color: Colors.blue)),
                WidgetSpan(child: SizedBox(height: 40)),
                TextSpan(text: st2, style: TextStyle(color: Colors.red)),
                WidgetSpan(child: SizedBox(height: 40)),
                TextSpan(text: st3, style: TextStyle(color: Colors.green)),
                WidgetSpan(child: SizedBox(height: 40)),
                TextSpan(text: st4, style: TextStyle(color: Colors.grey))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:assignment2/AuthorPage.dart';
import 'package:assignment2/SecretPage.dart';
import 'package:assignment2/UploadPage.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentPageIdx = 0;
  var pageList = [SecretPage(), UploadPage(), AuthorPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Row(
          children: [
            Text(
              "Open Secret",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white70,
      ),
      body: SafeArea(child: pageList[currentPageIdx]),
      // SafeArea(
      // child:
      // Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     mainAxisSize: MainAxisSize.min,
      //     children: [
      //       Text(
      //         "내용",
      //         style: TextStyle(fontFamily: 'Neo'),
      //       ),
      //       PageView(
      //         controller: pageController,
      //         physics: NeverScrollableScrollPhysics(),
      //         children: [
      //           SecretPage(),
      //           UploadPage(),
      //           AuthorPage(),
      //         ],
      //       )
      //     ],
      //   ),
      // ),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.grey.withOpacity(0.3),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white24,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        currentIndex: currentPageIdx,
        onTap: (index) {
          setState(() {
            currentPageIdx = index;
          });
          print("현재 페이지는 $currentPageIdx");
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "비밀 보기"),
          BottomNavigationBarItem(
              icon: Icon(Icons.post_add_rounded), label: "비밀 공유"),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: "회원 보기")
        ],
      ),
    );
  }
}

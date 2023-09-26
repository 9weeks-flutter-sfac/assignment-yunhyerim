import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> words = [
      {"word": "apple", "meaning": "사과", "example": "I want to eat an apple"},
      {
        "word": "paper",
        "meaning": "종이",
        "example": "Could you give me a paper"
      },
      {
        "word": "resilient",
        "meaning": "탄력있는, 회복력있는",
        "example": "She's a resilient girl"
      },
      {
        "word": "revoke",
        "meaning": "취소하다",
        "example":
            "The authorities have revoked their original decision to allow development of this rural area."
      },
      {
        "word": "withdraw",
        "meaning": "철회하다",
        "example":
            "After lunch, we withdrew into her office to finish our discussion in private."
      },
    ];

    var pageController = PageController();

    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        body: SafeArea(
          child: PageView.builder(
            controller: pageController,
            itemCount: words.length,
            itemBuilder: (context, index) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  words[index]["word"].toString(),
                  style: TextStyle(
                      letterSpacing: -1, //자간 설정
                      fontWeight: FontWeight.bold,
                      fontSize: 25),
                ),
                Text(
                  words[index]["meaning"]!,
                  style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: Colors.grey,
                      letterSpacing: -1),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  '"${words[index]["example"]!}"',
                  style: TextStyle(fontSize: 15, letterSpacing: 1),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                onPressed: () {
                  pageController.previousPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                },
                child: Icon(Icons.navigate_next),
              ),
              FloatingActionButton(
                onPressed: () {
                  pageController.nextPage(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeIn);
                },
                child: Icon(Icons.navigate_next),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

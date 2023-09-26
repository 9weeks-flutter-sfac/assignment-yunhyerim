import 'package:flutter/material.dart';

class QuizCard extends StatelessWidget {
  const QuizCard(
      {super.key,
      required this.quiz,
      required this.onCorrect,
      required this.onIncorrect});
  final Map<String, dynamic> quiz;
  final Function onCorrect;
  final Function onIncorrect;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            quiz["question"],
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(
            height: 16,
          ),
          ListView.builder(
            itemCount: quiz["options"].length,
            shrinkWrap:
                true, //pageview.builder 안에 listview가 있기 때문에 오류. shrinkwrap 사용
            itemBuilder: (context, index) => ElevatedButton(
              onPressed: () {
                if (quiz["answer"] == index + 1) {
                  onCorrect();
                } else {
                  onIncorrect();
                }
              },
              child: Text(quiz["options"][index]),
            ),
          ),
        ],
      ),
    );
  }
}

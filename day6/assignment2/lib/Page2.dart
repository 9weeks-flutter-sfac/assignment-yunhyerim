import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key, required this.mathData});

  final List<int> mathData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemBuilder: (context, index) {
          var element = mathData[index];
          print(index);
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(7.0),
                child: Container(
                  width: (element * 2),
                  height: 24,
                  child: Center(child: Text(element.toString())),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          blurRadius: 4,
                          blurStyle: BlurStyle.solid,
                          color: Colors.grey)
                    ],
                  ),
                ),
              ),
            ],
          );
        },
        itemCount: 100,
      ),
    );
  }
}

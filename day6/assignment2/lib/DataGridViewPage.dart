import 'package:flutter/material.dart';

class DataGridView extends StatelessWidget {
  const DataGridView({super.key, required this.mathData});

  final List<int> mathData;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          childAspectRatio: 1,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
        ),
        itemCount: mathData.length,
        itemBuilder: (BuildContext context, int index) {
          String inputData = mathData[index].toString();
          return Container(
            alignment: Alignment.center,
            child: Text(inputData),
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.amber,
              boxShadow: [
                BoxShadow(color: Colors.grey, blurRadius: 7),
              ],
            ),
          );
        },
      ),
    );
  }
}

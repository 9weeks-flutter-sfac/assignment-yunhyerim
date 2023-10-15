// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:assignment3/model/dict.dart';
import 'package:assignment3/widget/meaning_card.dart';
import 'package:flutter/material.dart';

class DictCard extends StatelessWidget {
  const DictCard({super.key, required this.dict});
  final Dict dict;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              dict.word,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Divider(),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: dict.meanings.length,
              itemBuilder: (context, index) {
                return MeaningCard(meaning: dict.meanings[index]);
              },
            )
          ],
        ),
      ),
    );
  }
}

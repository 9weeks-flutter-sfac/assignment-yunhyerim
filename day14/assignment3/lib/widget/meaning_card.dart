import 'package:flutter/material.dart';

import '../model/meaning.dart';

class MeaningCard extends StatelessWidget {
  const MeaningCard({super.key, required this.meaning});
  final Meaning meaning;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(meaning.partOfSpeech,
              style: TextStyle(fontWeight: FontWeight.bold)),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return ListTile(
                  title: Text(meaning.definitions[index].definition));
            },
            itemCount: meaning.definitions.length,
          ),
        ],
      ),
    );
  }
}

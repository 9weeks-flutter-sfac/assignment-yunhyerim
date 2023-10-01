import 'package:flutter/material.dart';

class CardImageContainer extends StatefulWidget {
  const CardImageContainer({super.key, required this.imgUrl});
  final String imgUrl;

  @override
  State<CardImageContainer> createState() => _CardImageContainerState();
}

class _CardImageContainerState extends State<CardImageContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: SizedBox(
          width: 173,
          height: 173,
          child: Image.network(
            widget.imgUrl,
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
      decoration: BoxDecoration(
          border: Border.all(width: 0.7, color: Colors.grey),
          borderRadius: BorderRadius.circular(16)),
    );
  }
}

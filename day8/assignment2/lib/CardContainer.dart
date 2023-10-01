import 'package:assignment2/CardImageContainer.dart';
import 'package:flutter/material.dart';

class CardContainer extends StatefulWidget {
  const CardContainer({super.key, required this.imgUrl, required this.msg});
  final String imgUrl;
  final String msg;

  @override
  State<CardContainer> createState() => _CardContainerState();
}

class _CardContainerState extends State<CardContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 7,
          ),
          CardImageContainer(imgUrl: widget.imgUrl),
          SizedBox(height: 6),
          Text(widget.msg),
          SizedBox(
            height: 7,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Icon(Icons.comment),
              ),
            ],
          )
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
              color: Colors.grey, blurRadius: 3, blurStyle: BlurStyle.outer),
        ],
      ),
    );
  }
}

import 'package:assignment3/main.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('7일차 과제 2번'),
      ),
      body: Center(
        child: CarouselSlider.builder(
          itemCount: imageUrl.length,
          itemBuilder: (context, index, realIndex) => ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Image.network(imageUrl[index]),
          ),
          options: CarouselOptions(
            autoPlay: true,
            // autoPlayInterval: Duration(milliseconds: 2500),
            autoPlayAnimationDuration: Duration(milliseconds: 2500),
          ),
        ),
      ),
    );
  }
}

// ignore_for_file: prefer_const_constructors

import 'package:assignment2/model/profile.dart';
import 'package:flutter/material.dart';

class DetailProfilePage extends StatefulWidget {
  const DetailProfilePage(
      {super.key,
      required this.name,
      required this.email,
      required this.phone,
      required this.address,
      required this.company,
      required this.profileImage});

  final String name;
  final String email;
  final String phone;
  final Address address;
  final Company company;
  final String profileImage;

  @override
  State<DetailProfilePage> createState() => _DetailProfilePageState();
}

class _DetailProfilePageState extends State<DetailProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(widget.name),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            clipBehavior: Clip.none, // circleavatar가 잘리지 않게 설정
            children: [
              Image.network(
                widget.profileImage,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 320,
                colorBlendMode: BlendMode.darken,
                color: Colors.black45,
              ),
              Positioned(
                bottom: -48, //radius 크기만큼
                child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: CircleAvatar(
                    radius: 48,
                    backgroundImage: NetworkImage(widget.profileImage),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 56,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.name,
              style: TextStyle(fontSize: 32),
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Information",
                  style: TextStyle(fontSize: 28),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Icon(Icons.email),
                    SizedBox(
                      width: 8,
                    ),
                    Text(widget.email),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.phone),
                    SizedBox(
                      width: 8,
                    ),
                    Text(widget.phone),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.location_on),
                    SizedBox(
                      width: 8,
                    ),
                    Text(widget.address.city),
                  ],
                ),
              ],
            ),
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Company",
                  style: TextStyle(fontSize: 28),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(widget.company.name),
                SizedBox(
                  height: 8,
                ),
                Text(widget.company.catchPhrase),
                SizedBox(
                  height: 8,
                ),
                Text(widget.company.bs),
              ],
            ),
          )
        ],
      ),
    );
  }
}

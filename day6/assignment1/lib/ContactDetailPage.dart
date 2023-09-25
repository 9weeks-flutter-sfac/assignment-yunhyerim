// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:assignment1/ContactTile.dart';
import 'package:flutter/material.dart';

class ContactDetailPage extends StatelessWidget {
  const ContactDetailPage(
      {super.key, required this.contactList, required this.index});

  final List<List<String>> contactList;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
          height: 200,
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              SizedBox(
                height: 13,
              ),
              IconButton(
                icon: Icon(Icons.arrow_back_ios),
                color: Colors.white,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),

        centerTitle: false,

        title: Container(
            height: 200,
            alignment: Alignment.topLeft,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Text(
                  '연락처 상세',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            )),
        // forceMaterialTransparency: true,
        flexibleSpace: Image(
          image: NetworkImage('https://picsum.photos/100/100'),
          fit: BoxFit.cover,
        ),
        backgroundColor: Colors.transparent,
        toolbarHeight: 200,
        actions: [
          Container(
            height: 200,
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                SizedBox(
                  height: 24,
                ),
                Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
              ],
            ),
          )
        ],
        elevation: 0,
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ContactTile(contactList: contactList, index: index),
          ),
        ],
      ),
    );
  }
}

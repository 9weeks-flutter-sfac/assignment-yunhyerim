// ignore_for_file: prefer_const_constructors

import 'package:assignment1/ContactDetailPage.dart';
import 'package:flutter/material.dart';

class ContactTile extends StatelessWidget {
  ContactTile({super.key, required this.contactList, required this.index});

  final List<List<String>> contactList;
  final int index;

  @override
  Widget build(BuildContext context) {
    var name = contactList[index][0];
    var phoneNumber = contactList[index][1];

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        // SizedBox(width: 10),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage('https://picsum.photos/100/100'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name),
                  SizedBox(height: 3),
                  Text(phoneNumber,
                      style: TextStyle(
                        color: const Color.fromARGB(255, 112, 111, 111),
                      )),
                ],
              ),
            ),
          ],
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.call),
        )
      ],
    );
  }
}

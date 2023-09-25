import 'package:flutter/material.dart';

import 'ContactDetailPage.dart';
import 'ContactTile.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({
    super.key,
  });

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  var contactList = [
    ['이테디', '010-1000-2000'],
    ['밀리', '010-1000-2000'],
    ['크리스', '010-1000-2000'],
    ['주노', '010-1000-2000'],
    ['해리', '010-1000-2000'],
    ['벨라', '010-1000-2000'],
    ['헬렌', '010-1000-2000'],
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Column(
            children: [
              InkWell(
                child: ContactTile(
                  contactList: contactList,
                  index: index,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ContactDetailPage(
                          contactList: contactList, index: index),
                    ),
                  );
                },
              ),
              SizedBox(height: 10)
            ],
          );
        },
        itemCount: contactList.length,
      ),
    );
  }
}

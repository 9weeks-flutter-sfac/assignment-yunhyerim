import 'package:flutter/material.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Admin Page')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('메뉴 추가'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('메뉴 삭제'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('메뉴 수정'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

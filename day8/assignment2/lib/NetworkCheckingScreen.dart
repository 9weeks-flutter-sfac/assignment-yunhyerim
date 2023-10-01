import 'package:flutter/material.dart';

class NetworkCheckingScreen extends StatefulWidget {
  const NetworkCheckingScreen(
      {super.key,
      required this.isCheckingNetwork,
      required this.isConnectedNetwork});

  final bool isCheckingNetwork;
  final bool isConnectedNetwork;

  @override
  State<NetworkCheckingScreen> createState() => _NetworkCheckingScreenState();
}

class _NetworkCheckingScreenState extends State<NetworkCheckingScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (widget.isCheckingNetwork) Text('인터넷 연결 확인 중 입니다.'),
          if (!widget.isConnectedNetwork && !widget.isCheckingNetwork)
            Text('NO INTERNET'),
          SizedBox(
            height: 10,
          ),
          if (widget.isCheckingNetwork) CircularProgressIndicator(),
        ],
      ),
    );
  }
}

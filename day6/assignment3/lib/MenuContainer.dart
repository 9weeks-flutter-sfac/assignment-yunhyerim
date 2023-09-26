import 'package:flutter/material.dart';

class MenuContainer extends StatefulWidget {
  MenuContainer({super.key, required this.imgUrl, required this.menuName});

  final String imgUrl;
  final String menuName;

  @override
  State<MenuContainer> createState() => _MenuContainerState();
}

class _MenuContainerState extends State<MenuContainer> {
  @override
  Widget build(BuildContext context) {
    var menuContainer = Container(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //이미지
          SizedBox(
            height: 82,
            width: 120,
            child: Image.asset(
              widget.imgUrl,
              fit: BoxFit.fitWidth,
            ),
          ),
          //메뉴명 및 담기
          Container(
            alignment: Alignment.bottomLeft,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.menuName,
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 12),
                ),
                Text(
                  '[담기]',
                  style: TextStyle(fontSize: 12),
                )
              ],
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 0.3,
        ),
      ),
    );

    return menuContainer;
  }
}

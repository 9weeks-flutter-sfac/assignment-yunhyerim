import 'package:flutter/material.dart';

class MenuContainer extends StatefulWidget {
  const MenuContainer(
      {super.key, required this.imgUrl, required this.menuName});

  final String imgUrl;
  final String menuName;

  @override
  State<MenuContainer> createState() => _MenuContainerState();
}

class _MenuContainerState extends State<MenuContainer> {
  @override
  Widget build(BuildContext context) {
    var menuContainer = Container(
      height: 106,
      width: 105,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          //이미지
          SizedBox(
            height: 65,
            child: Image.asset(
              widget.imgUrl,
              width: 105,
              fit: BoxFit.fitWidth,
            ),
          ),
          //메뉴명
          Text(
            widget.menuName,
            style: TextStyle(fontWeight: FontWeight.w900),
          ),
          Text('[담기]')
        ],
      ),
      decoration:
          BoxDecoration(border: Border.all(color: Colors.black, width: 0.3)),
    );

    return menuContainer;
  }
}

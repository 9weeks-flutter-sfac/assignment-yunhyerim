import 'package:flutter/material.dart';

class DrinkTile extends StatelessWidget {
  const DrinkTile(
      {super.key,
      required this.menuName,
      required this.menuEnglishName,
      required this.price,
      required this.imgUrl});

  final String menuName;
  final String menuEnglishName;
  final String price;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    var drinkTile = ListTile(
      title: Text(
        menuName,
        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
      ),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start, //수직 시작지점 정렬
        children: [
          Text(menuEnglishName,
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                  fontWeight: FontWeight.w200)),
          Text(
            price + '원',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          )
        ],
      ),
      leading: SizedBox(
        width: 60,
        child: CircleAvatar(
          backgroundImage: AssetImage(imgUrl),
          radius: 48,
        ),
      ),
    );

    return drinkTile;
  }
}

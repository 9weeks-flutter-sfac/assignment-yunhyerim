import 'package:flutter/material.dart';

class MusicTile extends StatelessWidget {
  const MusicTile(
      {super.key,
      required this.imgUrl,
      required this.title,
      required this.artist,
      required this.playtime});

  final String imgUrl;
  final String title;
  final String artist;
  final String playtime;

  @override
  Widget build(BuildContext context) {
    var musicTile = Row(
      // mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        //album cover
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ClipRRect(
            child: Image.asset(
              imgUrl,
              width: 60,
              height: 60,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        SizedBox(
          width: 8,
        ),
        //설명
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          // mainAxisSize: MainAxisSize.min,
          children: [
            //제목
            SizedBox(
              width: 200,
              child: Text(
                title,
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                maxLines: 2,
                // softWrap: true,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            //가수 and playtime
            SizedBox(
              width: 220,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.check_circle,
                    size: 15,
                  ),
                  SizedBox(width: 3),
                  //가수
                  Flexible(
                    child: Text(
                      artist,
                      style: TextStyle(fontSize: 15),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Text(
                    ' · ',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w900,
                      // overflow: TextOverflow.visible,
                    ),
                  ),
                  Text(
                    playtime,
                    style: TextStyle(fontSize: 15),
                    maxLines: 1,
                  )
                ],
              ),
            ),
          ],
        ),
        Spacer(),
        //more icon
        SizedBox(width: 20, child: Icon(Icons.more_vert)),
        SizedBox(width: 10),
      ],
    );

    return musicTile;
  }
}

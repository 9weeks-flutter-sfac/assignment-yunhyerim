import 'package:flutter/material.dart';

class MusicPlayerPage extends StatefulWidget {
  const MusicPlayerPage(
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
  State<MusicPlayerPage> createState() => _MusicPlayerPageState();
}

class _MusicPlayerPageState extends State<MusicPlayerPage> {
  var isPaused = false;

  @override
  Widget build(BuildContext context) {
    var snackBar = SnackBar(
      content: Text('준비 중인 기능입니다.'),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {},
      ),
      duration: Duration(milliseconds: 500),
    );

    var musicPlayer = Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(fontWeight: FontWeight.normal),
        ),
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios)),
        backgroundColor: Colors.black12,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(widget.imgUrl),
            SizedBox(
              height: 8,
            ),
            Text(
              widget.title,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            Text(
              widget.artist,
              style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w300,
                  color: Colors.grey),
            ),
            SizedBox(
              height: 7,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    child: Icon(Icons.skip_previous)),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  child: isPaused ? Icon(Icons.play_arrow) : Icon(Icons.pause),
                  onTap: () {
                    isPaused = !isPaused;
                    setState(() {});
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                ),
                SizedBox(
                  width: 10,
                ),
                InkWell(
                  child: Icon(Icons.skip_next),
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
    return musicPlayer;
  }
}

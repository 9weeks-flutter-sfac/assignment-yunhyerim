import 'package:assignment2/MusicTile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var youtubeMusicApp = MaterialApp(
      // dark 테마 적용
      theme: ThemeData.from(colorScheme: ColorScheme.dark()),
      home: Scaffold(
        appBar: AppBar(
          // backgroundColor: Colors.black,
          elevation: 0,
          title: Text('아워리스트'),
          centerTitle: false,
          leading: Icon(Icons.arrow_back_ios),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.airplay),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.search),
            ),
          ],
          shape: Border(
            bottom: BorderSide(color: Colors.white24, width: 1),
          ),
        ),
        body: ListView(
          children: [
            MusicTile(
              imgUrl: 'assets/music_come_with_me.png',
              title: 'Come with Me',
              artist: 'Surfaces 및 salem ilese',
              playtime: '3:00',
            ),
            MusicTile(
              imgUrl: 'assets/music_good_day.png',
              title: 'Good day',
              artist: 'Surfaces',
              playtime: '3:00',
            ),
            MusicTile(
              imgUrl: 'assets/music_honesty.png',
              title: 'Honesty',
              artist: 'Pink Sweat',
              playtime: '3:00',
            ),
            MusicTile(
              imgUrl: 'assets/music_i_wish_i_missed_my_ex.png',
              title: 'I Wish I Missed My Ex',
              artist: '마할리아 버크마',
              playtime: '3:00',
            ),
            MusicTile(
              imgUrl: 'assets/music_plastic_plants.png',
              title: 'Plastic Plants',
              artist: '마할리아 버크마',
              playtime: '3:00',
            ),
            MusicTile(
              imgUrl: 'assets/music_sucker_for_you.png',
              title: 'Sucker for you',
              artist: '맷 테리',
              playtime: '3:00',
            ),
            MusicTile(
              imgUrl: 'assets/music_summer_is_for_falling_in_love.png',
              title: 'Summer is for falling in love',
              artist: 'Sarah Kang & Eye Love Brandon',
              playtime: '3:00',
            ),
            MusicTile(
              imgUrl: 'assets/music_these_days.png',
              title: 'These days(feat. Jess Glynne, Macklemore & Dan Caplen)',
              artist: 'Rudimental',
              playtime: '3:00',
            ),
            MusicTile(
              imgUrl: 'assets/music_you_make_me.png',
              title: 'You Make Me',
              artist: 'DAY6',
              playtime: '3:00',
            ),
            MusicTile(
              imgUrl: 'assets/music_zombie_pop.png',
              title: 'Zombie Pop',
              artist: 'DRP IAN',
              playtime: '3:00',
            ),
            //음악 목록 한개
            // Row(
            //   children: [
            //     //album cover
            //     Padding(
            //       padding: const EdgeInsets.all(8.0),
            //       child: ClipRRect(
            //         child: Image.asset(
            //           'assets/music_come_with_me.png',
            //           width: 60,
            //           height: 60,
            //         ),
            //         borderRadius: BorderRadius.circular(8),
            //       ),
            //     ),
            //     SizedBox(
            //       width: 10,
            //     ),
            //     //설명
            //     Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         //제목
            //         Text(
            //           'Title',
            //           style: TextStyle(fontSize: 20),
            //         ),
            //         //artist and playtime
            //         Row(
            //           children: [
            //             Icon(
            //               Icons.check_circle,
            //               size: 15,
            //             ),
            //             SizedBox(width: 3),
            //             Text('artist', style: TextStyle(fontSize: 17)),
            //             Text(
            //               ' · ',
            //               style: TextStyle(
            //                 fontSize: 17,
            //                 fontWeight: FontWeight.w900,
            //               ),
            //             ),
            //             Text('playtime', style: TextStyle(fontSize: 17))
            //           ],
            //         ),
            //       ],
            //     ),
            //     Spacer(),
            //     //more icon
            //     Icon(Icons.more_vert),
            //     SizedBox(
            //       width: 10,
            //     ),
            //   ],
            // )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          // backgroundColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          currentIndex: 2,
          fixedColor: Colors.white,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
            BottomNavigationBarItem(icon: Icon(Icons.explore), label: '둘러보기'),
            BottomNavigationBarItem(
                icon: Icon(Icons.library_music), label: '보관함')
          ],
        ),
        bottomSheet: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 64,
              color: Colors.white12,
              child: ListTile(
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: Image.asset('assets/music_you_make_me.png'),
                ),
                title: Text('You make me'),
                subtitle: Text('DAY6'),
                trailing: Row(
                  mainAxisSize: MainAxisSize
                      .min, //row와 column은 기본적으로 max로 확장하려한다 min으로 바꿔준다
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.play_arrow),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.skip_next),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 1,
              alignment: Alignment.centerLeft,
              child: Container(
                width: 110,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );

    return youtubeMusicApp;
  }
}

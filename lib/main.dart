import 'package:flutter/material.dart';
import 'package:practice_work/Provider/AudioProvider.dart';
import 'package:practice_work/Provider/VideoProvider.dart';
import 'package:practice_work/Provider/streamProvider.dart';
import 'package:practice_work/view/screen/api_2_screen.dart';
import 'package:practice_work/view/screen/api_screen.dart';
import 'package:practice_work/view/screen/government_screen.dart';
import 'package:practice_work/view/screen/song_detail_page.dart';
import 'package:practice_work/view/screen/song_page.dart';
import 'package:practice_work/view/screen/video_detail_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => StreamController(),
      ),
      ChangeNotifierProvider(create: (context) => AudioProvider()),
      ChangeNotifierProvider(create: (context) => VideoControllers()),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: "api_single_screen",
        routes: {
          "government_screen": (context) => SongPage(),
          "song_detail_page": (context) => SongDetailPage(),
          "video_detail_page": (context) => VideoDetailPage(),
          "api_single_screen": (context) => APISingleScreen(),
          "api_multiple_screen": (context) => APIMultipleScreen(),
        });
  }
}

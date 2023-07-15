import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:practice_work/Provider/AudioProvider.dart';
import 'package:practice_work/Provider/VideoProvider.dart';
import 'package:practice_work/componets/song_page.dart';
import 'package:provider/provider.dart';

import '../../componets/video_page.dart';

class SongPage extends StatefulWidget {
  const SongPage({super.key});

  @override
  State<SongPage> createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> with TickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 400));
    Provider.of<VideoControllers>(context, listen: false).init(index: 0);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          bottom: TabBar(indicatorColor: Colors.purple.shade100, tabs: [
            Icon(
              Icons.music_note_outlined,
              color: Colors.purple.shade300,
              size: 30,
            ),
            Icon(
              Icons.video_collection,
              color: Colors.purple.shade300,
              size: 30,
            ),
          ]),
          title: Text(
            "Media Player",
            style: TextStyle(
              fontSize: 30,
              color: Colors.purple.shade300,
            ),
          ),
        ),
        body: TabBarView(
          children: [
            SongPlayer(),
            VideoPlayer(),
          ],
        ),
      ),
    );
  }
}

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:practice_work/Provider/AudioProvider.dart';
import 'package:practice_work/Provider/VideoProvider.dart';
import 'package:provider/provider.dart';

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
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          bottom: TabBar(indicatorColor: Colors.purple, tabs: [
            Icon(
              Icons.music_note_outlined,
              color: Colors.purple,
              size: 30,
            ),
            Icon(
              Icons.video_collection,
              color: Colors.purple,
              size: 30,
            ),
          ]),
          title: const Text(
            "Audio Player",
            style: TextStyle(
              fontSize: 40,
              color: Colors.purple,
            ),
          ),
        ),
        body: TabBarView(
          children: [
            Consumer<AudioProvider>(
              builder: (context, provider, child) => StreamBuilder(
                stream: provider.assetsAudioPlayer.currentPosition,
                builder: (context, AsyncSnapshot<Duration> snapShot) {
                  if (snapShot.hasData) {
                    double currentPosition =
                        snapShot.data!.inSeconds.toDouble();
                    return SingleChildScrollView(
                      child: ListView.separated(
                          itemBuilder: (context, index) => ListTile(
                                onTap: () {
                                  provider.changeIndex(index: index);
                                },
                                title: Text("Audio ${index + 1}"),
                              ),
                          separatorBuilder: (context, index) => Divider(),
                          itemCount: provider.Audios.length),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
            Consumer<VideoControllers>(
              builder: (context, pro, child) => Center(
                child: pro.videoPlayerController.value.isInitialized
                    ? Column(
                        children: [
                          AspectRatio(
                            aspectRatio:
                                pro.videoPlayerController.value.aspectRatio,
                            child: Chewie(
                              controller: pro.chewieController,
                            ),
                          ),
                          SizedBox(
                            child: ListView.separated(
                                itemBuilder: (context, index) => ListTile(
                                      onTap: () {
                                        pro.changeIndex(index: index);
                                      },
                                      leading: CircleAvatar(
                                        foregroundImage: pro.VideoImages[index],
                                      ),
                                      title: Text(
                                          pro.VideosName[index].toString()),
                                    ),
                                separatorBuilder: (context, index) => Divider(),
                                itemCount: pro.Videos.length),
                          ),
                        ],
                      )
                    : const CircularProgressIndicator(),
              ),
            )
          ],
        ),
      ),
    );
  }
}

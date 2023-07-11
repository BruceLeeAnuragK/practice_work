import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:practice_work/Provider/AudioProvider.dart';
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
              IconButton(
                  splashColor: Colors.white,
                  onPressed: () {},
                  icon: Icon(
                    Icons.music_note_outlined,
                    color: Colors.purple,
                    size: 30,
                  )),
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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Slider(
                                activeColor: Colors.purple,
                                min: 0,
                                max:
                                    provider.totalDuration.inSeconds.toDouble(),
                                value: currentPosition,
                                onChanged: (val) {
                                  provider.seek(seconds: val.toInt());
                                }),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${snapShot.data!.inMinutes}:${(snapShot.data!.inSeconds) % 60}"),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                        "${provider.totalDuration.inMinutes} :${(provider.totalDuration.inSeconds) % 60}"),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  child: IconButton(
                                      onPressed: () {
                                        provider.skip(seconds: -10);
                                      },
                                      icon: const Icon(
                                        Icons.skip_previous,
                                        color: Colors.purple,
                                        size: 20,
                                      )),
                                ),
                                Expanded(
                                  child: StreamBuilder(
                                      stream:
                                          provider.assetsAudioPlayer.isPlaying,
                                      builder: (context,
                                          AsyncSnapshot<bool> snapShot) {
                                        snapShot.data!
                                            ? animationController.forward()
                                            : animationController.reverse();

                                        return IconButton(
                                            onPressed: () {
                                              if (snapShot.data!) {
                                                provider.pause();
                                                animationController.reverse();
                                                setState(() {});
                                              } else {
                                                provider.play();
                                                animationController.forward();
                                                setState(() {});
                                              }
                                            },
                                            icon: AnimatedIcon(
                                              color: Colors.purple,
                                              icon: AnimatedIcons.play_pause,
                                              progress: animationController,
                                            ));
                                      }),
                                ),
                                Expanded(
                                  child: IconButton(
                                      onPressed: () {
                                        provider.skip(seconds: 10);
                                      },
                                      icon: const Icon(
                                        Icons.skip_next,
                                        size: 20,
                                        color: Colors.purple,
                                      )),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ),
              Center(
                child: Container(
                  child: Text(
                    "Videos",
                    style: TextStyle(fontSize: 40, color: Colors.purple),
                  ),
                ),
              )
            ],
          )),
    );
  }
}

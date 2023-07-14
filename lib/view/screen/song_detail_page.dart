import 'package:flutter/material.dart';
import 'package:practice_work/Provider/AudioProvider.dart';
import 'package:provider/provider.dart';

class SongDetailPage extends StatefulWidget {
  const SongDetailPage({Key? key}) : super(key: key);

  @override
  State<SongDetailPage> createState() => _SongDetailPageState();
}

class _SongDetailPageState extends State<SongDetailPage>
    with TickerProviderStateMixin {
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
    return Consumer<AudioProvider>(
      builder: (context, provider, child) => SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: Text("Audio Image"),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Colors.purple,
                    Colors.purpleAccent,
                  ])),
                ),
                StreamBuilder(
                  stream: provider.assetsAudioPlayer.currentPosition,
                  builder: (context, AsyncSnapshot<Duration> snapShot) {
                    if (snapShot.hasData) {
                      double currentPosition =
                          snapShot.data!.inSeconds.toDouble();
                      return SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
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
                                        // snapShot.data!
                                        //     ? animationController.forward()
                                        //     : animationController.reverse();

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
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Divider(
                              height: 3,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

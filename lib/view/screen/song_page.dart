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
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Audio Player",
            style: TextStyle(
              fontSize: 20,
              color: Colors.indigo,
            ),
          ),
        ),
        body: Center(
          child: Consumer<AudioProvider>(
            builder: (context, provider, child) => StreamBuilder(
              stream: provider.assetsAudioPlayer.currentPosition,
              builder: (context, AsyncSnapshot<Duration> snapShot) {
                if (snapShot.hasData) {
                  double currentPosition = snapShot.data!.inSeconds.toDouble();
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Slider(
                          min: 0,
                          max: provider.totalDuration.inSeconds.toDouble(),
                          value: currentPosition,
                          onChanged: (val) {
                            provider.seek(seconds: val.toInt());
                          }),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              "${snapShot.data!.inMinutes}:${snapShot.data!.inSeconds}"),
                          Text(
                              "${provider.totalDuration.inMinutes} :${provider.totalDuration.inSeconds}"),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                              onPressed: () {
                                provider.skip(seconds: -10);
                              },
                              icon: const Icon(
                                Icons.skip_previous,
                                size: 20,
                              )),
                          StreamBuilder(
                              stream: provider.assetsAudioPlayer.isPlaying,
                              builder: (context, AsyncSnapshot<bool> snapShot) {
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
                                      icon: AnimatedIcons.play_pause,
                                      progress: animationController,
                                    ));
                              }),
                          IconButton(
                              onPressed: () {
                                provider.skip(seconds: 10);
                              },
                              icon: const Icon(
                                Icons.skip_next,
                                size: 20,
                              )),
                        ],
                      )
                    ],
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ),
        ));
  }
}

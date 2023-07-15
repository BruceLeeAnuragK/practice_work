import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:practice_work/Provider/AudioProvider.dart';
import 'package:practice_work/Provider/VideoProvider.dart';
import 'package:provider/provider.dart';

class VideoDetailPage extends StatefulWidget {
  const VideoDetailPage({Key? key}) : super(key: key);

  @override
  State<VideoDetailPage> createState() => _VideoDetailPageState();
}

class _VideoDetailPageState extends State<VideoDetailPage>
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
    return Consumer<VideoControllers>(
      builder: (context, pro, child) => SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: [
                AspectRatio(
                  aspectRatio: pro.videoPlayerController.value.aspectRatio,
                  child: Chewie(
                    controller: pro.chewieController,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

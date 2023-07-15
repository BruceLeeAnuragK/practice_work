import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/VideoProvider.dart';

class VideoPlayer extends StatefulWidget {
  const VideoPlayer({Key? key}) : super(key: key);

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  @override
  Widget build(BuildContext context) {
    return Consumer<VideoControllers>(
      builder: (context, pro, child) => Center(
        child: pro.videoPlayerController.value.isInitialized
            ? ListView.separated(
                itemBuilder: (context, index) => Card(
                  color: Colors.purple,
                  child: ListTile(
                    onTap: () {
                      pro.changeIndex(index: index);
                      Navigator.of(context).pushNamed("video_detail_page");
                    },
                    leading: CircleAvatar(
                      foregroundImage: NetworkImage(pro.VideoImages[index]),
                    ),
                    title: Text(
                      pro.VideosName[index].toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                separatorBuilder: (context, index) => Column(),
                itemCount: pro.Videos.length,
              )
            : const CircularProgressIndicator(color: Colors.purple),
      ),
    );
  }
}

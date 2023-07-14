import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/AudioProvider.dart';

class MediaPage extends StatefulWidget {
  const MediaPage({super.key});

  @override
  State<MediaPage> createState() => _MediaPageState();
}

class _MediaPageState extends State<MediaPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AudioProvider>(
      builder: (context, provider, child) => StreamBuilder(
        stream: provider.assetsAudioPlayer.currentPosition,
        builder: (context, AsyncSnapshot<Duration> snapShot) {
          if (snapShot.hasData) {
            double currentPosition = snapShot.data!.inSeconds.toDouble();
            return ListView.separated(
                itemBuilder: (context, index) => ListTile(
                      onTap: () {
                        provider.changeIndex(index: index);
                        Navigator.of(context).pushNamed("song_detail_page");
                      },
                      title: Text("Audio ${index + 1}"),
                    ),
                separatorBuilder: (context, index) => Divider(),
                itemCount: provider.Audios.length);
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

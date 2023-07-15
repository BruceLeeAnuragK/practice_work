import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/AudioProvider.dart';

class SongPlayer extends StatefulWidget {
  const SongPlayer({super.key});

  @override
  State<SongPlayer> createState() => _SongPlayerState();
}

class _SongPlayerState extends State<SongPlayer> {
  @override
  Widget build(BuildContext context) {
    return Consumer<AudioProvider>(
      builder: (context, provider, child) => StreamBuilder(
        stream: provider.assetsAudioPlayer.currentPosition,
        builder: (context, AsyncSnapshot<Duration> snapShot) {
          if (snapShot.hasData) {
            double currentPosition = snapShot.data!.inSeconds.toDouble();
            return ListView.separated(
                itemBuilder: (context, index) => Card(
                      color: Colors.purple,
                      child: ListTile(
                        onTap: () {
                          provider.changeIndex(index: index);
                          Navigator.of(context).pushNamed("song_detail_page",
                              arguments: provider.AudioImages[index]);
                        },
                        leading: CircleAvatar(
                          foregroundImage: NetworkImage(
                            provider.AudioImages[index],
                          ),
                        ),
                        title: Text(
                          provider.AudioName[index],
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                separatorBuilder: (context, index) => Column(),
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

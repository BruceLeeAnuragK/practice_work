import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

import '../Model/my_song.dart';

class AudioProvider extends ChangeNotifier {
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
  Duration totalDuration = Duration.zero;
  List Audios = [
    "assets/audio/1.mp3",
    "assets/audio/2.mp3",
    "assets/audio/3.mp3",
    "assets/audio/4.mp3",
  ];
  AudioProvider() {
    init(index: 0);
  }
  init({required int index}) {
    assetsAudioPlayer
        .open(Audio(Audios[index]), autoStart: false, showNotification: true)
        .then((value) {
      totalDuration = assetsAudioPlayer.current.value!.audio.duration;
      print("DONE>>>>>>>>>>>>>>>>>>>>>>>>>");
    });
  }

  changeIndex({required int index}) {
    assetsAudioPlayer.pause();
    init(index: index);
  }

  play() async {
    await assetsAudioPlayer.play();
    notifyListeners();
  }

  pause() async {
    await assetsAudioPlayer.pause();
    notifyListeners();
  }

  seek({required int seconds}) async {
    await assetsAudioPlayer.seek(Duration(seconds: seconds));
    notifyListeners();
  }

  skip({required int seconds}) async {
    assetsAudioPlayer.seekBy(Duration(seconds: seconds));
    notifyListeners();
  }

  get isPlaying {
    return assetsAudioPlayer.isPlaying.value;
  }

  get currentPosition {
    return assetsAudioPlayer.currentPosition;
  }
}

import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

import '../Model/my_song.dart';

class AudioProvider extends ChangeNotifier {
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
  Duration totalDuration = Duration.zero;

  AudioProvider() {
    assetsAudioPlayer
        .open(Audio("assets/audio/1.mp3"),
            autoStart: false, showNotification: true)
        .then((value) {
      totalDuration = assetsAudioPlayer.current.value!.audio.duration;
      debugPrint("DONE>>>>>>>>>>>>>>>>>>>>>>>>>");
    });
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

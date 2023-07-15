import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

class AudioProvider extends ChangeNotifier {
  AssetsAudioPlayer assetsAudioPlayer = AssetsAudioPlayer();
  Duration totalDuration = Duration.zero;
  List AudioImages = [
    "https://pagalnew.com/coverimages/what-jhumka-rocky-aur-rani-kii-prem-kahaani-500-500.jpg",
    "https://pagalnew.com/coverimages/dil-se-dil-tak-bawaal-500-500.jpg",
    "https://pagalnew.com/coverimages/tumhe-kitna-pyaar-karte-bawaal-500-500.jpg",
    "https://pagalnew.com/coverimages/Raat-Baaki-Satyaprem-Ki-Katha-500-500.jpg",
    "https://pagalnew.com/coverimages/pasoori-nu-satyaprem-ki-katha-500-500.jpg",
    "https://pagalnew.com/coverimages/King-Of-Indian-Hip-Hop-Emiway-Bantai-500-500.jpg",
    "https://pagalnew.com/coverimages/issa-vibe-bloody-daddy-500-500.jpg",
    "https://pagalnew.com/coverimages/Dilbara-Rashmi-Virag-500-500.jpg",
    "https://pagalnew.com/coverimages/Ek-Tu-Hi-Hai-Tanishk-Bagchi-500-500.jpg",
    "https://pagalnew.com/coverimages/Ab-Hum-Na-Milenge-Ankit-Tiwari-500-500.jpg",
  ];
  List Audios = [
    "assets/audio/What_Jhumka.mp3",
    "assets/audio/Dil_Se_Dil_Tak.mp3",
    "assets/audio/Tumhe_Kitna.mp3",
    "assets/audio/Raat_Baaki.mp3",
    "assets/audio/Pasoori_Nu.mp3",
    "assets/audio/King_Of_Indian.mp3",
    "assets/audio/Issa_Vibe.mp3",
    "assets/audio/Dilbara_Rashmi.mp3",
    "assets/audio/Ek_Tu_Hi_Hai.mp3",
    "assets/audio/Ab_Hum_Na_Milenege.mp3",
  ];
  List AudioName = [
    "What_Jhumka.mp3",
    "Dil_Se_Dil_Tak.mp3",
    "Tumhe_Kitna.mp3",
    "Raat_Baaki.mp3",
    "Pasoori_Nu.mp3",
    "King_Of_Indian.mp3",
    "Issa_Vibe.mp3",
    "Dilbara_Rashmi.mp3",
    "Ek_Tu_Hi_Hai.mp3",
    "Ab_Hum_Na_Milenege.mp3",
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
    notifyListeners();
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

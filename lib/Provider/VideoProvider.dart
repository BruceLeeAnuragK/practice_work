import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';

class VideoControllers extends ChangeNotifier {
  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;
  List VideoImages = [
    "https://pagalworldl.com/uploads/thumb/sft10/4772_4.jpg",
    "https://ghantalele.com/uploads/thumbs/cat/7387_2.jpg",
    "https://thumb.pagalworld.gay/thumb/sft170/84903_4.jpg",
    "https://pagalworld.video/siteuploads/thumb/sft3/1360_resize_320x180.webp",
    "https://pagalworld.video/siteuploads/thumb/sft3/1337_resize_320x180.webp",
    "https://pagalworld.video/siteuploads/thumb/sft1/80_resize_320x180.webp",
    "https://pagalworld.video/siteuploads/thumb/sft3/1342_resize_320x180.webp",
    "https://pagalworld.video/siteuploads/thumb/sft3/1198_resize_320x180.webp",
    "https://pagalworld.video/siteuploads/thumb/sft3/1183_resize_320x180.webp",
    "https://pagalworld.video/siteuploads/thumb/sft1/77_resize_320x180.webp",
    "https://pagalworld.video/siteuploads/thumb/sft1/92_resize_320x180.webp",
    "https://pagalworld.video/siteuploads/thumb/sft1/89_resize_320x180.webp",
    "https://pagalworld.video/siteuploads/thumb/sft1/369_resize_320x180.webp",
  ];
  List Videos = [
    "assets/videos/Pasoori_Nu.mp4",
    "assets/videos/Tu_Hai_Sheetal_Dhaara.mp4",
    "assets/videos/Tu_Maan_Meri_Jaan.mp4",
    "assets/videos/Danger.mp4",
    "assets/videos/Huppa_Huiya.mp4",
    "assets/videos/Kehndi_Hundi_Si.mp4",
    "assets/videos/O_Sajnaa_Junior.mp4",
    "assets/videos/Teri_Deewani.mp4",
    "assets/videos/Aaj_Ke_Baad_Tu_Meri_Rehna.mp4",
    "assets/videos/Deewane_Hum_Nahi_Hote.mp4",
    "assets/videos/Manike_Mage_Hithe.mp4",
    "assets/videos/Kithe_Chaliye_Tu.mp4",
    "assets/videos/Calm_Down.mp4",
  ];
  List VideosName = [
    "Pasoori_Nu.mp4",
    "Tu_Hai_Sheetal_Dhaara.mp4",
    "Tu_Maan_Meri_Jaan.mp4",
    "Danger.mp4",
    "Huppa_Huiya.mp4",
    "Kehndi_Hundi_Si.mp4",
    "O_Sajnaa_Junior.mp4",
    "Teri_Deewani.mp4",
    "Aaj_Ke_Baad_Tu_Meri_Rehna.mp4",
    "Deewane_Hum_Nahi_Hote.mp4",
    "Manike_Mage_Hithe.mp4",
    "Kithe_Chaliye_Tu.mp4",
    "Calm_Down.mp4",
  ];
  VideoControllers() {
    init(index: 0);
  }
  init({required int index}) {
    videoPlayerController = VideoPlayerController.asset(Videos[index])
      ..initialize().then((value) {
        chewieController = ChewieController(
          videoPlayerController: videoPlayerController,
          aspectRatio: videoPlayerController.value.aspectRatio,
          autoPlay: false,
        );
        notifyListeners();
      });
  }

  changeIndex({required int index}) {
    videoPlayerController.pause();
    chewieController.pause();
    notifyListeners();
    init(index: index);
  }

  play() async {
    videoPlayerController.play();
    notifyListeners();
  }

  pause() async {
    videoPlayerController.pause();
    notifyListeners();
  }
}

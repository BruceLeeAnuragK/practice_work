import 'package:flutter/cupertino.dart';
import 'package:video_player/video_player.dart';

class VideoProvider extends ChangeNotifier {
  late VideoPlayerController videoPlayerController;
  List VideoImages = [
    "https://hdvideo9.com/siteuploads/thumb/sft20/9557_resize2x_320x180.webp",
    "https://hdvideo9.com/siteuploads/thumb/sft20/9563_resize2x_320x180.webp",
    "https://hdvideo9.com/siteuploads/thumb/sft19/9368_resize2x_320x180.webp",
    "https://hdvideo9.com/siteuploads/thumb/sft7/3001_8_resize2x_320x180.webp"
  ];
  List Videos = [
    "assets/videos/",
  ];
  init({required int index}) {
    videoPlayerController = VideoPlayerController.asset(
      Videos[index],
    )..initialize().then((value) {
        notifyListeners();
      });
  }
}

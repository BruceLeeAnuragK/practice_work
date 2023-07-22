import 'package:async_wallpaper/async_wallpaper.dart';
import 'package:flutter/material.dart';

class WallPaperDetailPage extends StatefulWidget {
  const WallPaperDetailPage({super.key});

  @override
  State<WallPaperDetailPage> createState() => _WallPaperDetailPageState();
}

class _WallPaperDetailPageState extends State<WallPaperDetailPage> {
  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Add Wall Paper",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.green,
            backgroundColor: Colors.white,
          ),
        ),
      ),
      body: Stack(
        children: [
          Image.network(
            data['largeImageURL'],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          AsyncWallpaper.setWallpaper(
            url: data["largeImageURL"],
            goToHome: true,
            errorToastDetails: ToastDetails.error(),
            toastDetails: ToastDetails.success(),
            wallpaperLocation: AsyncWallpaper.BOTH_SCREENS,
          );
        },
        child: const Icon(Icons.wallpaper),
      ),
    );
  }
}

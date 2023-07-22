import 'package:async_wallpaper/async_wallpaper.dart';
import 'package:flutter/material.dart';
import 'package:practice_work/Provider/APiProvider.dart';
import 'package:provider/provider.dart';

class WallPapers extends StatefulWidget {
  const WallPapers({super.key});

  @override
  State<WallPapers> createState() => _WallPapersState();
}

class _WallPapersState extends State<WallPapers> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ApiController>(builder: (context, provider, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "Wallpaper App",
            style: TextStyle(
              color: Colors.green,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Consumer<ApiController>(builder: (context, provider, child) {
          List data = provider.data;
          return Center(
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  onSubmitted: (val) {
                    print("SEARCH : $val");
                    provider.search(val: val);
                  },
                ),
                const SizedBox(
                  height: 30,
                ),
                Expanded(
                  child: GridView.builder(
                    itemCount: provider.data.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                            "wallPaper_detail_screen",
                            arguments: data[index]);
                      },
                      child: ClipRect(
                        child: Image.network(data[index]['largeImageURL'],
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
      );
    });
  }
}

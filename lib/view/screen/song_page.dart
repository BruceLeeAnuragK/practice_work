import 'package:flutter/material.dart';
import 'package:practice_work/Provider/AudioProvider.dart';
import 'package:provider/provider.dart';

class SongPage extends StatefulWidget {
  const SongPage({super.key});

  @override
  State<SongPage> createState() => _SongPageState();
}

class _SongPageState extends State<SongPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Audio Player",style: TextStyle( fontSize: 20,color: Colors.indigo, ),),
      ),
      body: Center(
        child: Consumer<AudioProvider>(
          builder: (context, provider,child) => StreamBuilder(builder: (context, AsyncSnapshot<Duration> snapShot)
              {
                if(snapShot.hasData)
                  {
                    double currentPosition = snapShot.data!.inSeconds.toDouble();
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Slider(
                          min: 0,
                            max: provider.totalDuration.inSeconds.toDouble(),
                            value: currentPosition, onChanged: (val)
                        {
                          provider.seek(seconds: val.toInt());
                        }),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("${snapShot.data!.inMinutes}:${snapShot.data!.inSeconds}"),
                            Text("${provider.totalDuration.inMinutes} :${provider.totalDuration.inSeconds}"),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(onPressed: ()
                                {
                                  provider.play();
                                }, icon: Icon(Icons.play_arrow,size: 20,)),
                            IconButton(onPressed: ()
                                {
                                  provider.pause();
                                }, icon: Icon(Icons.pause,size: 20,)),
                          ],
                        )
                      ],
                    );
                  }
                 else{
                   return Center(child: CircularProgressIndicator());
                }
              }
          ),
        ),
      )
    );
  }
}

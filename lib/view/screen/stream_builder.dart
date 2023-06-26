import 'package:flutter/material.dart';

class StreamBuilderScreen extends StatefulWidget {
  const StreamBuilderScreen({Key? key}) : super(key: key);

  @override
  State<StreamBuilderScreen> createState() => _StreamBuilderScreenState();
}

class _StreamBuilderScreenState extends State<StreamBuilderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Stream Builder",style: TextStyle(
          fontSize: 20,

        ),),
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}

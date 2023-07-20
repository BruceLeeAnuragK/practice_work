import 'package:flutter/material.dart';
import 'package:practice_work/helper/api_helper_class.dart';

import '../../Model/post_model.dart';

class APIMultipleScreen extends StatefulWidget {
  const APIMultipleScreen({super.key});

  @override
  State<APIMultipleScreen> createState() => _APIMultipleScreenState();
}

class _APIMultipleScreenState extends State<APIMultipleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.yellow,
        title: Text(
          "Api Multiple Screen",
          style: TextStyle(fontSize: 20, color: Colors.brown),
        ),
      ),
      body: FutureBuilder(
        future: APIhelper.apihelper.getMultipleResponse(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Posts> posts = snapshot.data as List<Posts>;
            return ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) => Card(
                child: ListTile(
                  title: Text("${posts[index].title}"),
                  leading: Text("${posts[index].id}"),
                ),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("There is an Error : ${snapshot.error}"),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.yellow,
              ),
            );
          }
        },
      ),
    );
  }
}

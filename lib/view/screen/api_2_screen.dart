import 'package:flutter/material.dart';
import 'package:practice_work/helper/api_helper_class.dart';

import '../../Model/post_model.dart';

class APISingeScreen extends StatefulWidget {
  const APISingeScreen({super.key});

  @override
  State<APISingeScreen> createState() => _APISingeScreenState();
}

class _APISingeScreenState extends State<APISingeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Api Screen",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      body: FutureBuilder(
        future: APIhelper.apihelper.getSingleresponse(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Posts posts = snapshot.data!;
            return Card(
              child: ListTile(
                title: Text("${posts.title}"),
                leading: Text("${posts.id}"),
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("There is an Error"),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:practice_work/helper/api_helper_class.dart';

import '../../Model/post_model.dart';

class APISingleScreen extends StatefulWidget {
  const APISingleScreen({super.key});

  @override
  State<APISingleScreen> createState() => _APISingleScreenState();
}

class _APISingleScreenState extends State<APISingleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.green,
        title: const Text(
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        child: Icon(
          Icons.add,
          size: 20,
        ),
        onPressed: () {
          Navigator.of(context)
              .pushNamed("api_multiple_screen")
              .then((value) => setState(() {}));
        },
      ),
    );
  }
}

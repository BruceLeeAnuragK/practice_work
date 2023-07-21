import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Model/post_model.dart';

class APIhelper {
  APIhelper._();
  static final APIhelper apihelper = APIhelper._();
  String Api = "https://dummyjson.com/posts/15";
  String Api2 = "https://jsonplaceholder.typicode.com/posts";
  Future<Posts?> getSingleresponse() async {
    http.Response response = await http.get(Uri.parse(Api));

    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);
      Posts post = Posts.fromMap(data: data);
      return post;
    }
  }

  Future<List<Posts>?> getMultipleResponse() async {
    http.Response response = await http.get(Uri.parse(Api2));
    print("**********************");
    print(response.statusCode);
    print("**********************");
    if (response.statusCode == 200) {
      print("--- start if conditon");
      print(response.body);
      List alldata = jsonDecode(response.body);
      print("*******************");
      print(alldata);
      print("*******************");
      List<Posts> allPosts =
          alldata.map((e) => Posts.fromMap(data: e)).toList();
      return allPosts;
    }
  }

  Future<List?> getWallpaperResponse({required String query}) async {
    String WallpaperApi =
        "https://pixabay.com/api/?key=37043026-230b0692a2c7c3b735944c114&q=$query";
    http.Response response = await http.get(Uri.parse(WallpaperApi));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      List allData = data["hits"];
      return allData;
    }
  }
}

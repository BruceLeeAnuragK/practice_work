import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Model/post_model.dart';

class APIhelper {
  APIhelper._();
  static final APIhelper apihelper = APIhelper._();
  String Api = "https://dummyjson.com/posts/15";
  String Api2 = "https://dummyjson.com/posts/";
  Future<Posts?> getSingleresponse() async {
    http.Response response = await http.get(Uri.parse(Api));

    if (response.statusCode == 200) {
      Map data = jsonDecode(response.body);
      Posts post = Posts.fromMap(data: data);
      return post;
    }
  }

  Future<Posts?> getMultipleResponse() {}
}

import 'package:flutter/cupertino.dart';
import 'package:practice_work/helper/api_helper_class.dart';

class ApiController extends ChangeNotifier {
  List data = [];
  ApiController() {
    search();
  }
  search({String val = "nature"}) async {
    data = await APIhelper.apihelper.getWallpaperResponse(query: val) ?? [];
    notifyListeners();
    return 0;
  }
}

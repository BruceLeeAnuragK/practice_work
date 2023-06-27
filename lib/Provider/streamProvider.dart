import 'package:flutter/cupertino.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:provider/provider.dart';

class StreamController extends ChangeNotifier{
  InAppWebViewController? controller;
  String initUrl = "";
  bool callBack= false;
  bool callForward = false;

  initialize({
    required InAppWebViewController controller
  })
  {
    this.controller = controller;
    notifyListeners();
  }

  back()
  {
    controller!.goBack();
    notifyListeners();
  }

  forward()
  {
    controller!.goForward();
    notifyListeners();
  }

  check() async
  {
    callBack = await controller!.canGoBack();
    callForward = await controller!.canGoForward();
    notifyListeners();
  }
}
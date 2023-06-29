import 'package:flutter/cupertino.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:provider/provider.dart';

class StreamController extends ChangeNotifier {
  InAppWebViewController? controller;
  String initUrl = "";
  bool callBack = false;
  bool callForward = false;
  PullToRefreshController? refreshController;

  initialize({required InAppWebViewController controller}) {
    this.controller = controller;
    refreshController = PullToRefreshController(
        options: PullToRefreshOptions(enabled: true),
        onRefresh: () {
          controller.reload();
          notifyListeners();
        });

    notifyListeners();
  }

  back() {
    controller!.goBack();
    notifyListeners();
  }

  forward() {
    controller!.goForward();
    notifyListeners();
  }

  check() async {
    callBack = await controller!.canGoBack();
    callForward = await controller!.canGoForward();
    notifyListeners();
  }
}

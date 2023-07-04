import 'package:flutter/cupertino.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:provider/provider.dart';

class StreamController extends ChangeNotifier {
  InAppWebViewController? controller;
  String initUrl = "https://services.india.gov.in/service/listing?cat_id=4&ln=en";
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

  endRefresh()
  {
    refreshController!.endRefreshing();
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

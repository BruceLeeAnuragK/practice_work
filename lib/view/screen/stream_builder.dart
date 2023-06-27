import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:practice_work/Provider/streamProvider.dart';
import 'package:provider/provider.dart';

class StreamBuilderScreen extends StatefulWidget {
  const StreamBuilderScreen({Key? key}) : super(key: key);

  @override
  State<StreamBuilderScreen> createState() => _StreamBuilderScreenState();
}

class _StreamBuilderScreenState extends State<StreamBuilderScreen> {

Connectivity connectivity = Connectivity();

  @override
  Widget build(BuildContext context) {
    return Consumer<StreamController>(
      builder: (context, provider, child) => Scaffold(
        appBar: AppBar(
          title: Text(
            "Stream Builder",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        body: StreamBuilder(
          stream: connectivity.onConnectivityChanged,
          builder: (context, snapShot) {
            if (snapShot.hasData) {
              ConnectivityResult res = snapShot.data!;
              switch (res) {
                case ConnectivityResult.mobile:
                  return Center(
                    child: Builder(
                      builder: (context) {
                        return InAppWebView(
                          initialUrlRequest: URLRequest(url:Uri.parse(provider.initUrl)),
                            onWebViewCreated: (controller,url) async {

                            }
                        );
                      },
                    ),
                  );
                case ConnectivityResult.wifi:
                  return Center(
                    child: Text("WIFI CONNECION !!"),
                  );
                case ConnectivityResult.none:
                  return Center(child: Text("NO Connection !!"),);
                default:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
              }
          }
            else if (snapShot.hasError){
              return Center(
                child: Text(snapShot.error.toString()),
              );
            }
            return Column();
          }
          ),
      ),
    );
  }
}

import 'dart:js';

import 'package:flutter/material.dart';
import 'package:practice_work/Provider/AudioProvider.dart';
import 'package:practice_work/Provider/streamProvider.dart';
import 'package:practice_work/view/screen/government_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => StreamController(),),
    ChangeNotifierProvider(create: (context) => AudioProvider())
  ], child:  MyApp(),) );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: "government_screen",
        routes: {
          "government_screen": (context) => GovernmentScreen(),
        });
  }
}

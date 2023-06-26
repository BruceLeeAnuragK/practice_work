import 'package:flutter/material.dart';
import 'package:practice_work/view/screen/government_screen.dart';

void main() {
  runApp(const MyApp());
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
     routes: {
      "government_screen": (context) => GovernmentScreen(),
     }
     
    );
  }
}



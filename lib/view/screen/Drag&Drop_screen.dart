import 'package:flutter/material.dart';

class DragScreen extends StatefulWidget {
  const DragScreen({super.key});

  @override
  State<DragScreen> createState() => _DragScreenState();
}

class _DragScreenState extends State<DragScreen> {
  @override
  Widget build(BuildContext context) {
    bool dropped = false;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Simple Drag and Drop",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Draggable(
                data: "demo",
                childWhenDragging: Container(
                  height: 150,
                  width: 150,
                  color: Colors.grey,
                ),
                child: Container(
                  height: 150,
                  width: 150,
                  color: Colors.red,
                ),
                feedback: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    border: Border.all(),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 10,
                        color: Colors.grey,
                        offset: Offset(5, 5),
                      ),
                    ],
                  ),
                ),
              ),
              DragTarget(
                builder: (context, _, __) => Container(
                  height: 150,
                  width: 150,
                  alignment: Alignment.center,
                  color: dropped ? Colors.red : Colors.grey,
                  child: Text(dropped ? "Item Dropped" : "Drop here"),
                ),
                onWillAccept: (data) {
                  return data == "demo";
                },
                onLeave: (val) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Missed !!"),
                      behavior: SnackBarBehavior.floating,
                      backgroundColor: Colors.red,
                    ),
                  );
                },
                onAccept: (data) {
                  setState(() {
                    dropped = true;
                  });
                },
              ),
            ],
          ),
        ));
  }
}

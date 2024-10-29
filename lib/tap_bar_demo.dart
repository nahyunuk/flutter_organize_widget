import 'package:flutter/material.dart';
class TapBarDemo extends StatefulWidget {
  const TapBarDemo({super.key});

  @override
  State<TapBarDemo> createState() => _TapBarDemoState();
}

class _TapBarDemoState extends State<TapBarDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("TapBarDemo",style: TextStyle(
          color: Colors.white
        ),),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SegmentedButtonDemo extends StatefulWidget {
  const SegmentedButtonDemo({super.key});

  @override
  State<SegmentedButtonDemo> createState() => _SegmentedButtonDemoState();
}

class _SegmentedButtonDemoState extends State<SegmentedButtonDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title:
            Text("SegmentedButtonDemo", style: TextStyle(color: Colors.white)),
      ),
      backgroundColor: Colors.white,
    );
  }
}

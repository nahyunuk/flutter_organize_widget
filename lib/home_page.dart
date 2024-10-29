import 'package:flutter/material.dart';
import 'package:flutter_organize_widget/animated_list_demo.dart';
import 'package:flutter_organize_widget/animated_list_practice.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> items = [
      GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AnimatedListDemo(),
              ));
        },
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Colors.blueAccent),
          child: Center(
              child: Text(
                'AnimatedListDemo',
                style: TextStyle(color: Colors.white),
              )),
        ),
      ),
      GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AnimatedListPratice(),
              ));
        },
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Colors.blueAccent),
          child: Center(
              child: Text(
                'AnimatedListPractice',
                style: TextStyle(color: Colors.white),
              )),
        ),
      ),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Main",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2개의 열
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return items[index];
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_organize_widget/AnimatedList/animated_list_demo.dart';
import 'package:flutter_organize_widget/AnimatedList/animated_list_practice.dart';
import 'package:flutter_organize_widget/TabBar/tab_bar_demo.dart';
import 'package:flutter_organize_widget/TabBar/tab_bar_practice.dart';
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override


  Widget build(BuildContext context) {
    Widget _buildListItem(BuildContext context, String title, Widget page) {
      return GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => page,
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.blueAccent,
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w600),
            ),
          ),
        ),
      );
    }
    List<Widget> items = [
      _buildListItem(context, 'AnimatedListDemo', AnimatedListDemo()),
      _buildListItem(context, 'AnimatedListPractice', AnimatedListPractice()),
      _buildListItem(context, 'TapBarDemo', TapBarDemo()),
      _buildListItem(context, 'TapBarPractice', TabBarPractice()),
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

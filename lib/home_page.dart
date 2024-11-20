import 'package:flutter/material.dart';
import 'package:flutter_organize_widget/AnimatedList/animated_list_demo.dart';
import 'package:flutter_organize_widget/AnimatedList/animated_list_practice.dart';
import 'package:flutter_organize_widget/CupertinoPicker/cupertino_picker_demo.dart';
import 'package:flutter_organize_widget/CupertinoPicker/cupertino_picker_practice.dart';
import 'package:flutter_organize_widget/Dismissible/dismissible_demo.dart';
import 'package:flutter_organize_widget/Dismissible/dismissible_practice.dart';
import 'package:flutter_organize_widget/RefreshIndicator/refresh_indicator_demo.dart';
import 'package:flutter_organize_widget/RefreshIndicator/refresh_indicator_practice.dart';
import 'package:flutter_organize_widget/SegmentedButton/segmented_button_demo.dart';
import 'package:flutter_organize_widget/SegmentedButton/segmented_button_practice.dart';
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
    Widget buildListItem(BuildContext context, String title, Widget page) {
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
            color: Colors.lightBlueAccent,
          ),
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      );
    }

    List<Widget> items = [
      buildListItem(context, 'AnimatedListDemo', AnimatedListDemo()),
      buildListItem(context, 'AnimatedListPractice', const AnimatedListPractice()),
      buildListItem(context, 'TapBarDemo', const TapBarDemo()),
      buildListItem(context, 'TapBarPractice', const TabBarPractice()),
      buildListItem(context, 'DismissibleDemo', const DismissibleDemo()),
      buildListItem(context, 'DismissblePractice', const DismissiblePractice()),
      buildListItem(context, 'SegmentedButton\nDemo', const SegmentedButtonDemo()),
      buildListItem(context, 'SegmentedButton\nPractice', const SegmentedButtonPractice()),
      buildListItem(context, 'RefreshIndicatorDemo', const RefreshIndicatorDemo()),
      buildListItem(context, 'RefreshIndicator\nPractice', const RefreshIndicatorPractice()),
      buildListItem(context, 'CupertinoPickerDemo', const CupertinoPickerDemo()),
      buildListItem(context, 'CupertinoPicker\nPractice', const CupertinoPickerPractice()),
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
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
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
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

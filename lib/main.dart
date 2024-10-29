import 'package:flutter/material.dart';
import 'package:flutter_organize_widget/home_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {


    return MaterialApp(
      home: HomePage(),
    );
  }
}

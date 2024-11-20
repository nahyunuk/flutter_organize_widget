import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoPickerDemo extends StatefulWidget {
  const CupertinoPickerDemo({super.key});

  @override
  State<CupertinoPickerDemo> createState() => _CupertinoPickerDemoState();
}

class _CupertinoPickerDemoState extends State<CupertinoPickerDemo> {
  List<String> colorItem = [
    "Red",
    "Pink",
    "Orange",
    "Yellow",
    "amber",
    "Blue",
    "Purple",
    "Black",
    "White"
  ];
  String colorString = "Red";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: const Text(
          "CupertinoPickerDemo",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height:200,
              width: 300,
              child: CupertinoPicker(
                onSelectedItemChanged: (i){
                  setState(() {
                    colorString = colorItem[i];
                  });
                },
                itemExtent: 30,
                children: [...colorItem.map((e) => Text(e),),],
              ),
            ),
            Text(colorString,style: const TextStyle(fontSize: 30),),
          ],
        ),
      ),
    );
  }
}

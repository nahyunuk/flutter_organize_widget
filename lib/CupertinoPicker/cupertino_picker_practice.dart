import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoPickerPractice extends StatefulWidget {
  const CupertinoPickerPractice({super.key});

  @override
  State<CupertinoPickerPractice> createState() =>
      _CupertinoPickerPracticeState();
}

class _CupertinoPickerPracticeState extends State<CupertinoPickerPractice> {
  late String timeString;
  List<String> time = [
    '00:00',
    '01:00',
    '02:00',
    '03:00',
    '04:00',
    '05:00',
    '06:00',
    '07:00',
    '08:00',
    '09:00',
    '10:00',
    '11:00',
    '12:00',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          "CupertinoPickerPractice",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              timeString.isNotEmpty ? timeString : '00 : 00',
              style: const TextStyle(
                color: Colors.lightBlue,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              width: 300,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.lightBlue,
                borderRadius: BorderRadius.circular(30),
              ),
              child: CupertinoPicker.builder(
                childCount: time.length,
                itemBuilder: (BuildContext context, int index) {
                  return Center(
                      child: Text(
                    time[index],
                  ));
                },
                itemExtent: 70,
                onSelectedItemChanged: (int value) {
                  setState(() {
                    timeString = time[value];
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

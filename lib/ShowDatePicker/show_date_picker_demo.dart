import 'package:flutter/material.dart';

class ShowDatePickerDemo extends StatefulWidget {
  const ShowDatePickerDemo({super.key});

  @override
  State<ShowDatePickerDemo> createState() => _ShowDatePickerDemoState();
}

class _ShowDatePickerDemoState extends State<ShowDatePickerDemo> {
  DateTime? _selectedDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          "ShowDataPickerDemo",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: OutlinedButton(
              onPressed: () {
                _showDatePicker();
              },
              child: const Text("showDatePicker"),
            ),
          ),
          Text(
            _selectedDate != null
                ? "${_selectedDate?.year} - ${_selectedDate?.month.toString()}월 ${_selectedDate?.day.toString()}일"
                : "Not Choice",
          )
        ],
      ),
    );
  }

  Future<DateTime?> _showDatePicker() {
    return showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ).then((selectedDate) {
      setState(() {
        _selectedDate = selectedDate;
      });
      return selectedDate;
    });
  }
}

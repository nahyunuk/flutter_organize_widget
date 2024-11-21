import 'package:flutter/material.dart';

class ShowDatePickerPratice extends StatefulWidget {
  const ShowDatePickerPratice({super.key});

  @override
  State<ShowDatePickerPratice> createState() => _ShowDatePickerPraticeState();
}

class _ShowDatePickerPraticeState extends State<ShowDatePickerPratice> {
  final List<Map<String, dynamic>> _list = [
    {
      'yearData': DateTime.now().year,
      'monData': DateTime.now().month,
      'dayData': DateTime.now().day,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          "ShowDataPickerPractice",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _showDatePicker();
              });
            },
            icon: const Icon(
              Icons.add,
              size: 30,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemExtent: 30,
              padding: const EdgeInsets.symmetric(vertical: 5),
              itemCount: _list.length,
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.lightBlue,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _list[index]['monData'] != null &&
                                _list[index]['dayData'] != null
                            ? "${_list[index]['yearData']} / ${_list[index]['monData'].toString()} / ${_list[index]['dayData'].toString()}"
                            : "오류",
                      )
                    ],
                  ),
                );
              },
            ),
          ),
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
        _list.add({
          'yearData': selectedDate?.year,
          'monData': selectedDate?.month,
          'dayData': selectedDate?.day,
        });
      });
      return selectedDate;
    });
  }
}

import 'package:flutter/material.dart';

class RefreshIndicatorPractice extends StatefulWidget {
  const RefreshIndicatorPractice({super.key});

  @override
  State<RefreshIndicatorPractice> createState() =>
      _RefreshIndicatorPracticeState();
}

class _RefreshIndicatorPracticeState extends State<RefreshIndicatorPractice> {
  List<String> _list = ['Apple', 'Banana', "Strawberry", "Watermelon"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          "RefreshIndicatorPractice",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: RefreshIndicator(
          child: ListView.builder(
            itemCount: _list.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(_list[index]),
              );
            },
          ),
          onRefresh: () async {
            setState(() {
              _list.add("lemon");
            });
          }),
    );
  }
}

import 'package:flutter/material.dart';

class DismissibleDemo extends StatefulWidget {
  const DismissibleDemo({super.key});

  @override
  State<DismissibleDemo> createState() => _DismissibleDemoState();
}

class _DismissibleDemoState extends State<DismissibleDemo> {
  List<int> items = List<int>.generate(10, (int index) => index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "DismissibleDemo",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        itemCount: items.length,
        padding: EdgeInsets.symmetric(vertical: 16),
        itemBuilder: (context, index) {
          return Dismissible(
              background: Container(
                color: Colors.lightBlue,
              ),
              key: ValueKey<int>(items[index]),
              onDismissed: (direction) {
                setState(() {
                  items.removeAt(index);
                });
              },
              child: ListTile(
                title: Text('item${items[index]}'),
              ));
        },
      ),
    );
  }
}

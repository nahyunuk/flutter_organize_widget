import 'package:flutter/material.dart';

class SegmentedButtonDemo extends StatefulWidget {
  const SegmentedButtonDemo({super.key});

  @override
  State<SegmentedButtonDemo> createState() => _SegmentedButtonDemoState();
}

class _SegmentedButtonDemoState extends State<SegmentedButtonDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title:
            Text("SegmentedButtonDemo", style: TextStyle(color: Colors.white)),
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Choice one"),
            ChoiceOne(),
            Text("choice"),
            Choice(),
          ],
        ),
      ),
    );
  }
}

enum _class { classOne, classTwo, classThree, classFour }

class ChoiceOne extends StatefulWidget {
  const ChoiceOne({super.key});

  @override
  State<ChoiceOne> createState() => _ChoiceOneState();
}

class _ChoiceOneState extends State<ChoiceOne> {
  _class classView = _class.classOne;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<_class>(
      segments: <ButtonSegment<_class>>[
        ButtonSegment<_class>(
          value: _class.classOne,
          label: Text("1반"),
          icon: Icon(Icons.school_outlined),
        ),
        ButtonSegment<_class>(
          value: _class.classTwo,
          label: Text("2반"),
          icon: Icon(Icons.school_outlined),
        ),
        ButtonSegment<_class>(
          value: _class.classThree,
          label: Text("3반"),
          icon: Icon(Icons.school_outlined),
        ),
        ButtonSegment<_class>(
          value: _class.classFour,
          label: Text("4반"),
          icon: Icon(Icons.school_outlined),
        ),
      ],
      selected: <_class>{classView},
      onSelectionChanged: (Set<_class> newSelection) {
        setState(() {
          classView = newSelection.first;
        });
      },
    );
  }
}

enum Major { Frontend, Backend, Design, App }

class Choice extends StatefulWidget {
  const Choice({super.key});

  @override
  State<Choice> createState() => _ChoiceState();
}

class _ChoiceState extends State<Choice> {
 Set <Major> MajorView = <Major>{Major.Frontend};

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<Major>(
      segments: <ButtonSegment<Major>>[
        ButtonSegment<Major>(
          value: Major.Frontend,
          icon: Icon(Icons.check_box_outline_blank),
          label: Text("FrontEnd", style: TextStyle(fontSize: 10)),
        ),
        ButtonSegment<Major>(
          icon: Icon(Icons.check_box_outline_blank),
          value: Major.Backend,
          label: Text("BackEnd", style: TextStyle(fontSize: 10)),
        ),
        ButtonSegment<Major>(
          icon:Icon(Icons.check_box_outline_blank) ,
          value: Major.Design,
          label: Text("Design", style: TextStyle(fontSize: 10)),
        ),
        ButtonSegment<Major>(
          value: Major.App,
          icon:Icon(Icons.check_box_outline_blank) ,
          label: Text(
            "App",
            style: TextStyle(fontSize: 10),
          ),
        ),
      ],
      selected: MajorView,
      onSelectionChanged: (Set<Major> newSelection) {
        setState(() {
          MajorView = newSelection;
        });
      },
      multiSelectionEnabled: true,
    );
  }
}

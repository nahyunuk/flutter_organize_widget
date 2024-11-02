import 'package:flutter/material.dart';

class SegmentedButtonPractice extends StatefulWidget {
  const SegmentedButtonPractice({super.key});

  @override
  State<SegmentedButtonPractice> createState() =>
      _SegmentedButtonPracticeState();
}

class _SegmentedButtonPracticeState extends State<SegmentedButtonPractice> {
  String _selectedGender = 'Man';
  String _selectedHobby = 'Movie';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          "SegmentedButtonPractice",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('ChoiceGender'),
            SegmentedButton<String>(
              segments: [
                ButtonSegment(
                  value: 'Man',
                  label: Text('Man'),
                  icon: Icon(Icons.man_2_rounded),
                ),
                ButtonSegment(
                  value: 'Woman',
                  label: Text('Woman'),
                  icon: Icon(Icons.woman_2_rounded),
                ),
              ],
              selected: {_selectedGender},
              onSelectionChanged: (p0) {
                setState(() {
                  _selectedGender = p0.first;
                });
              },
            ),
            Text('ChioceHobby'),
            SegmentedButton<String>(
              segments: [
                ButtonSegment(
                  value: 'Movie',
                  label: Text('Movie'),
                  icon: Icon(Icons.movie_creation_outlined),
                ),
                ButtonSegment(
                  value: 'Book',
                  label: Text('Book'),
                  icon: Icon(Icons.book),
                ),
                ButtonSegment(
                  value: 'Soccer',
                  label: Text("Soccer"),
                  icon: Icon(Icons.sports_soccer),
                ),
              ],
              selected: {_selectedHobby},
              onSelectionChanged: (p1) {
                setState(() {
                  _selectedHobby = p1.first;
                });
              },
            ),
            Text("Gender : ${_selectedGender}\nHobby : ${_selectedHobby}",textAlign: TextAlign.center,),
          ],
        ),
      ),
    );
  }
}

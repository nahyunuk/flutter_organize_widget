import 'package:flutter/material.dart';

class DismissiblePractice extends StatefulWidget {
  const DismissiblePractice({super.key});

  @override
  State<DismissiblePractice> createState() => _DismissiblePracticeState();
}

class _DismissiblePracticeState extends State<DismissiblePractice> {
  List<String> _toDoList = [];
  int _count = 0;
  final GlobalKey<AnimatedListState> _toDoListKey =
      GlobalKey<AnimatedListState>();
  final TextEditingController _titleController = TextEditingController();

  void _addItem(String title) {
    _toDoList.insert(0, title); // 리스트에 새로운 항목 추가 0번째(첫번쩨) 에 count++ 추가 한다
    _count++;
    _toDoListKey.currentState?.insertItem(0); // AnimatedList에 애니매이션과 함께 추가
  }
  void _removeItem(int index) {
    final removedItem = _toDoList.removeAt(index); // _toDoList 리스트에서 주어진 index에 해당하는 항목을 삭제하고, 삭제된 항목을 removedItem 변수에 저장합니다.
    _toDoListKey.currentState?.removeItem(
      index,
          (context, animation) => _buildTodoList(index, animation,removedItem), // index: 삭제될 항목의 인덱스 ,animation: 애니메이션 효과를 적용할 애니메이션 객체,removedItem: 삭제된 항목의 내용
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "DismissblePractice",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
              onPressed: () {
                _showInputDialog(context);
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: AnimatedList(
        initialItemCount: _toDoList.length,
        key: _toDoListKey,
        itemBuilder: (context, index, animation) {
          return Dismissible(
              onDismissed: (direction) {
                _removeItem(index);
              },
              background: Container(
                color: Colors.redAccent,
              ),
              key: UniqueKey(),
              child: _buildTodoList(index, animation, _toDoList[index]));
        },
      ),
    );
  }

  Widget _buildTodoList(int index, Animation<double> _animation, title) {
    return SizeTransition(
      sizeFactor: _animation,
      child: Container(
          height: 60,
          width: MediaQuery.of(context).size.width,
          color: Colors.blueAccent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                ),
              ),
            ],
          )),
    );
  }

  void _showInputDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('제목을입력 해주세요'),
            content: TextField(
              controller: _titleController,
              decoration: InputDecoration(hintText: "adc..."),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // 다이얼로그 닫기
                },
                child: Text('취소'),
              ),
              TextButton(
                onPressed: () {
                  String inputText = _titleController.text;
                  _addItem(inputText);
                  Navigator.of(context).pop(); // 다이얼로그 닫기
                },
                child: Text('확인'),
              ),
            ],
          );
        });
  }
}

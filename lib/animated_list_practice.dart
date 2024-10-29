import 'package:flutter/material.dart';

class AnimatedListPratice extends StatefulWidget {
  const AnimatedListPratice({super.key});

  @override
  State<AnimatedListPratice> createState() => _AnimatedListPraticeState();
}

class _AnimatedListPraticeState extends State<AnimatedListPratice> {
  final GlobalKey<AnimatedListState> _toDoListKey =
      GlobalKey<AnimatedListState>();
  final TextEditingController _titleController = TextEditingController();
  List<String> _toDoList = [];
  int count = 0;

  void _removeItem(int index) {
    final removedItem = _toDoList.removeAt(index); // _toDoList 리스트에서 주어진 index에 해당하는 항목을 삭제하고, 삭제된 항목을 removedItem 변수에 저장합니다.
    _toDoListKey.currentState?.removeItem(
      index,
      (context, animation) => _buildTodoList(index, animation,removedItem), // index: 삭제될 항목의 인덱스 ,animation: 애니메이션 효과를 적용할 애니메이션 객체,removedItem: 삭제된 항목의 내용
    );
  }

  void _addItem(String title) {
    _toDoList.insert(0, title); // 리스트에 새로운 항목 추가 0번째(첫번쩨) 에 count++ 추가 한다
    count++;
    _toDoListKey.currentState?.insertItem(0); // AnimatedList에 애니매이션과 함께 추가
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          "AnimatedListPractice",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                _showInputDialog(context);
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: AnimatedList(
        key: _toDoListKey,
        initialItemCount: _toDoList.length,
        itemBuilder: (context, index, animation) {
          return _buildTodoList(index, animation, _toDoList[index]);
        },
      ),
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

  Widget _buildTodoList(int index, Animation<double> _animation, title) {
    return SizeTransition(
      sizeFactor: _animation,
      child: Container(
          height: 60,
          width: MediaQuery.of(context).size.width,
          color: Colors.lightBlue,
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                    onPressed: () {
                      _removeItem(index);
                    },
                    icon: Icon(Icons.delete)),
              )
            ],
          )),
    );
  }
}

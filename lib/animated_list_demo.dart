import 'package:flutter/material.dart';

class AnimatedListDemo extends StatefulWidget {
  @override
  _AnimatedListDemoState createState() => _AnimatedListDemoState();
}

class _AnimatedListDemoState extends State<AnimatedListDemo> {
  final GlobalKey<AnimatedListState> _listKey =
      GlobalKey<AnimatedListState>(); // AnimatedList의 상태에 접근하기 위한 고유 키
  final List<int> _items = []; // list
  int _count = 0;

  void _addItem() {
    _items.insert(0, _count++); // 리스트에 새로운 항목 추가 0번째(첫번쩨) 에 count++ 추가 한다
    _listKey.currentState?.insertItem(0); // AnimatedList에 애니매이션과 함께 추가
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'AnimatedList',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
              onPressed: () {
                _addItem();
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: AnimatedList(
        key: _listKey,
        // 아까 만든 키를 설정
        initialItemCount: _items.length,
        // 리스트가 처음 렌더링될 때 표시할 항목의 개수, _items.length로 설정하면 기본적으로 모든 항목을 표시
        itemBuilder: (context, index, animation) => _buildItem(
            index, animation), // _buildItem에 index 값과 animation값을 넘겨줌
      ),
    );
  }

  Widget _buildItem(_index, _animation) {
    return
      // 애니메이션 효과를 통해 위젯의 크기를 점진적으로 확장하거나 축소하는 역할
      SizeTransition(
      sizeFactor: _animation,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 60,
        color: Colors.lightBlueAccent,
        margin: EdgeInsets.symmetric(vertical: 5),
        child: Center(
          child: Text(
            'Item ${_items[_index]}', // _items의 _index번째의 값
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      ),
    );
  }
}

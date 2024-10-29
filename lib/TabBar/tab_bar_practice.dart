import 'package:flutter/material.dart';

class TabBarPractice extends StatefulWidget {
  const TabBarPractice({super.key});

  @override
  State<TabBarPractice> createState() => _TabBarPracticeState();
}

class _TabBarPracticeState extends State<TabBarPractice>
    with TickerProviderStateMixin {
  late final TabController _tabController; // TabController 생성
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this); // TabController 설정
  }

  @override
  void dispose() {
    _tabController.dispose(); // TabController 삭제
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(
          "TabBarPractice",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.white,
          // 선택된 탭의 글자 색상
          unselectedLabelColor: Colors.white.withOpacity(0.6),
          // 선택되지 않은 탭의 글자 색상
          tabs: [
            Tab(
              text: "Money",
              icon: Icon(
                Icons.money,
                color: Colors.white,
              ),
            ),
            Tab(
              text: "Card",
              icon: Icon(
                Icons.credit_card,
                color: Colors.white,
              ),
            ),
            Tab(
              text: "Bitcoin",
              icon: Icon(
                Icons.currency_bitcoin,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          NestedTabBar("Money"),
          NestedTabBar("Card"),
          NestedTabBar("Bitcoin"),
        ],
      ),
    );
  }
}

class NestedTabBar extends StatefulWidget {
  const NestedTabBar(this.outertap, {super.key});

  final String outertap;

  @override
  State<NestedTabBar> createState() => _NestedTabBarState();
}

class _NestedTabBarState extends State<NestedTabBar>
    with TickerProviderStateMixin {
  late final TabController _secoundtabController; // TabController 생성
  @override
  void initState() {
    super.initState();
    _secoundtabController =
        TabController(length: 2, vsync: this); // TabController 설정
  }

  @override
  void dispose() {
    _secoundtabController.dispose(); // TabController 삭제
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar.secondary(
          controller: _secoundtabController,
          tabs: [
            Tab(
              text: "Like",
            ),
            Tab(
              text: "Unlike",
            ),
          ],
        ),
        Expanded(
            child: TabBarView(
          controller: _secoundtabController,
          children: [
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Container(
                color: Colors.lightBlue.withOpacity(0.1),
                child: Center(
                  child: Text("${widget.outertap} : Like"),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Container(
                color: Colors.lightBlue.withOpacity(0.1),
                child: Center(
                  child: Text("${widget.outertap} : Unlike"),
                ),
              ),
            )
          ],
        )),
      ],
    );
  }
}

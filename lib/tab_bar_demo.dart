import 'package:flutter/material.dart';

class TapBarDemo extends StatefulWidget {
  const TapBarDemo({super.key});

  @override
  State<TapBarDemo> createState() => _TapBarDemoState();
}

class _TapBarDemoState extends State<TapBarDemo> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            "TapBarDemo",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.cake),
              ),
              Tab(
                icon: Icon(Icons.apple),
              ),
              Tab(
                icon: Icon(Icons.favorite),
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(
                    "https://ecimg.cafe24img.com/pg299b34409484036/baekih1001/web/product/medium/20230613/ce94c88007e24270e9e7f45a6eb9271d.jpg"),
                Text("It is cake")
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
                children: [
              Image.network("https://health.chosun.com/site/data/img_dir/2023/06/20/2023062002262_0.jpg"),
              Text("It is apple"),
            ]),
            Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRja1Ls-AgJMJpmau-Qhfmh5VqWf4rtaoGvuA&s"),
                  Text("It is heart"),
                ]),
          ],
        ),
      ),
    );
  }
}

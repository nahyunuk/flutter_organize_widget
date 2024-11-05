import 'package:flutter/material.dart';

class RefreshIndicatorDemo extends StatefulWidget {
  const RefreshIndicatorDemo({super.key});

  @override
  State<RefreshIndicatorDemo> createState() => _RefreshIndicatorDemoState();
}

class _RefreshIndicatorDemoState extends State<RefreshIndicatorDemo> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: Text(
          "RefreshIndicatorDemo",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        color: Colors.white,
        backgroundColor: Colors.blueAccent,
        strokeWidth: 2.0,
        onRefresh: () async {
          return Future<void>.delayed(const Duration(seconds: 3));
        },
        child:
            Center(
              child: Image.network(
                'https://i.pinimg.com/564x/10/e2/69/10e269d3a9700e145190cd2a3e5faee7.jpg',
                width: 400,
                height: 600,
              ),
            ),

      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // Show refresh indicator programmatically on button tap.
          _refreshIndicatorKey.currentState?.show();
        },
        icon: const Icon(Icons.refresh),
        label: const Text('새로고침'),
      ),
    );
  }
}

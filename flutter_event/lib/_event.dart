

import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("事件传递"),
      ),
      body: const HYHomePage(),
    );
  }
}

class HYHomePage extends StatelessWidget {
  const HYHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("列表测试"),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            GestureDetector(
              onTapDown: (details) {
                print("outer click");
              },
              child: Container(
                width: 200,
                height: 200,
                color: Colors.yellow,
                alignment: Alignment.center,
              ),
            ),
            IgnorePointer(
              ignoring: false,
              child: GestureDetector(
                onTapDown: (details) {
                  print("inner click");
                },
                child: Container(
                  width: 100,
                  height: 100,
                  color: Colors.red,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// logic 层
class TestTwoLogic extends GetxController {

}


/// view层
class TestTwoPage extends StatelessWidget {
  TestTwoPage({Key? key}) : super(key: key);

  final logic = Get.find<TestTwoLogic>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("页面二"),),
      body: const Center(child: Text('页面二', style: TextStyle(fontSize: 30))),
    );
  }
}

///binding层
class TestTwoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TestTwoLogic());
  }
}
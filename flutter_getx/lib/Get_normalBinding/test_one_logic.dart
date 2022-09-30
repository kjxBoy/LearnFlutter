import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'main.dart';


///logic层
class TestOneLogic extends GetxController {
  void jump() {
    Get.toNamed(RouteConfig.testTwo);
    //Get.to(RouteConfig.testTwo, binding: )
  }
}

///view层
class TestOnePage extends StatelessWidget {
  final logic = Get.find<TestOneLogic>();

  TestOnePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('页面一')),
      body: const Center(child: Text('页面一', style: TextStyle(fontSize: 30.0))),
      floatingActionButton: FloatingActionButton(
        onPressed: () => logic.jump(),
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}

///binding层
class TestOneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TestOneLogic());
  }
}
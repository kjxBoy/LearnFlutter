import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../main.dart';


class GetJumpTwoLogic extends GetxController {
  var msg = '';

  @override
  void onReady() {
    // var map = Get.arguments;
    // msg = map;
    // update();

    super.onReady();
  }
}

class GetJumpTwoPage extends StatelessWidget {

  static const String routeName = "/page";

  /// find 是明显的查询操作
  final oneLogic = Get.find<GetJumpOneLogic>();
  /// put 是添加操作
  final twoLogic = Get.put(GetJumpTwoLogic());

  GetJumpTwoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("跨页面-Two"),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          oneLogic.increase();
        },
      ),
      body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              //计数显示
              GetBuilder<GetJumpOneLogic>(builder: (logic) {
                return Text("跨页面-Two点击了${logic.count}次", style: const TextStyle(fontSize: 24),);
              }),

              GetBuilder<GetJumpTwoLogic>(builder: (logic) {
                return Text("传递：${logic.msg}", style: const TextStyle(fontSize: 24),);
              }),


            ],
          ),
      ),
    );
  }
}
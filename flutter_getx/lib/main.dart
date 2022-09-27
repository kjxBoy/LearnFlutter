import 'package:flutter/material.dart';
import 'package:flutter_getx/two_page.dart';
import 'package:get/get.dart';

class GetJumpOneLogic extends GetxController {
  var count = 0;

  jumpToVc() {
    Get.toNamed(GetJumpOnePage.routeName, arguments: "这是传递的数据");
  }

  increase() {
    count += 1;
    update();
  }
}

void main() => runApp(GetMaterialApp(
      getPages: [
        GetPage(
            name: GetJumpOnePage.routeName, page: () => GetJumpTwoPage()),
        GetPage(name: "/", page: () => GetJumpOnePage()),
      ],
      initialRoute: "/",
    ));

class GetJumpOnePage extends StatelessWidget {
  static const String routeName = "/page";
  final logic = Get.put(GetJumpOneLogic());
  GetJumpOnePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("跨页面-One"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: logic.jumpToVc,
          child: const Icon(Icons.arrow_forward_outlined),
        ),
        body: Center(child: GetBuilder<GetJumpOneLogic>(
          builder: (logic) {
            return Text(
              "跨页面-Two点击了${logic.count}次",
              style: const TextStyle(fontSize: 30),
            );
          },
        )));
  }
}

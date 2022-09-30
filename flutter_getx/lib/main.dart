import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/router_report.dart';

import 'Get_normalType/two_page.dart';

class GetJumpOneLogic extends GetxController {
  var count = 0;

  jumpToVc() {
    Get.toNamed(GetJumpTwoPage.routeName, arguments: "这是传递的数据");
  }

  increase() {
    count += 1;
    update();
  }
}

void main() => runApp(
    GetMaterialApp(
      getPages: [
        GetPage(name: GetJumpTwoPage.routeName, page: () => GetJumpTwoPage()),
        GetPage(name: "/", page: () => GetJumpOnePage()),
      ],
      initialRoute: "/",
      navigatorObservers: [GetXRouterObserver()],
    ));

class GetJumpOnePage extends StatelessWidget {
  final logic = Get.put(GetJumpOneLogic());
  GetJumpOnePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("跨页面-One"),
        ),
        floatingActionButton: FloatingActionButton(
          // logic.jumpToVc,
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) {
                return GetJumpTwoPage();
              }),
            );
          },
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

/// 将GetX的GetController进行释放管理
///自定义这个关键类！！！！！！
class GetXRouterObserver extends NavigatorObserver {
  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    RouterReportManager.reportCurrentRoute(route);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) async {
    RouterReportManager.reportRouteDispose(route);
  }
}

import 'package:flutter_getx/Get_normalBinding/test_one_logic.dart';
import 'package:flutter_getx/Get_normalBinding/test_two_logic.dart';
import 'package:get/get.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: RouteConfig.testOne,
      getPages: RouteConfig.getPages,
    );
  }
}

class RouteConfig {
  static const String testOne = "/testOne";
  static const String testTwo = "/testOne/testTwo";

  static final List<GetPage> getPages = [
    GetPage(
      name: testOne,
      page: () => TestOnePage(),
      binding: TestOneBinding(),
    ),
    GetPage(
      name: testTwo,
      page: () => TestTwoPage(),
      binding: TestTwoBinding(),
    ),
  ];
}
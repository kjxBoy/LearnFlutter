import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() => runApp(
  // const GetMaterialApp(home: Home())
    const MaterialApp(
      home: Home(),
    )
);

class Controller extends GetxController {
  var count = 0.obs;
  increment() => count++;
}

/// model
// 我们将使整个类成为可观察的，而不是每个属性。
class User{
  User({this.name = '', this.age = 0});
  String name;
  int age;
}
/// Controller
class UserController extends GetxController {
  final user = User().obs;
  updateUserName(String name){
    //当你需要更新user变量时。
    user.update( (user) { // 这个参数是你要更新的类本身。
      user?.name = name;
      user?.age = 18;
    });
  }

  updateUserAge() {
    // 更新user变量的另一种方式。
    print("updateUserAge");
    int age = user.value.age + 1;
    user(User(name: user.value.name, age: age));
  }
}

/// view
class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    print("重新构建 - Home - build");

    // 使用Get.put()实例化你的类，使其对当下的所有子路由可用。
    final Controller c = Get.put(Controller());
    final userController = Get.put(UserController());

    return Scaffold(
      // 使用Obx(()=>每当改变计数时，就更新Text()。
        appBar: AppBar(title: Obx(() => Text("Clicks: ${userController.user.value.age}"))),

        // 用一个简单的Get.to()即可代替Navigator.push那8行，无需上下文！
        body: Center(
            child: ElevatedButton(
                child: const Text("Go to Other"),
                onPressed: () => Get.to(Other()))),
        floatingActionButton: FloatingActionButton(
            onPressed: userController.updateUserAge,
            child: const Icon(Icons.add)));
  }
}

class Other extends StatelessWidget {
  // 你可以让Get找到一个正在被其他页面使用的Controller，并将它返回给你。
  final Controller c = Get.find();

  Other({Key? key}) : super(key: key);

  @override
  Widget build(context) {
    print("重新构建 - Other - build");
    // 访问更新后的计数变量
    return Scaffold(body: Center(child: Text("${c.count}")));
  }
}

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: "/",
      routes: {
        DetailPage.routeName : (ctx) => const DetailPage(),
        "/": (ctx) => const MyHomePage()
      },
      onGenerateRoute: (settings){ // 主要用来给跳转页面的构造函数传递参数
        if (settings.name == JXAboutPage.routeName) {
          return MaterialPageRoute(
              builder: (ctx) {
                return JXAboutPage(message: settings.arguments as String);
              }
          );
        }
        return null;
      },

      onUnknownRoute: (settings){
        return MaterialPageRoute(
            builder: (ctx){
              return const UnknownPage();
        });
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _message = "初始";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("首页"),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_message, style: const TextStyle(fontSize: 30),),
            ElevatedButton(
                onPressed: () => _onPushTap(context),
                child: const Text("打开详情页")
            ),
            ElevatedButton(
                onPressed: () => _onPushAbout(context),
                child: const Text("打开about页")
            ),
            ElevatedButton(
                onPressed: () => _onUnknownPage(context),
                child: const Text("兜底 - Unknown")
            )
          ],
        ),
      ),
    );
  }

  // 按钮点击执行的代码
  _onPushTap(BuildContext context) {
    final future = Navigator.of(context).pushNamed(
        DetailPage.routeName,
        arguments: "传入一个文本"
    );
    future.then((value){
      setState(() {
        _message = value as String;
      });
    });
  }
  // 按钮点击执行的代码
  _onPushAbout(BuildContext context) {
     Navigator.of(context).pushNamed(JXAboutPage.routeName, arguments: "传入一个文本");
  }

  // 按钮点击执行的代码
  _onUnknownPage(BuildContext context) {
    Navigator.of(context).pushNamed("/unknown", arguments: "传入一个文本");
  }
}

class DetailPage extends StatelessWidget {

  static const String routeName = "/detail";

  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final message = ModalRoute.of(context)?.settings.arguments;
    
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("第二页"),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios), 
            onPressed: () => _onBackTap(context) ,
          )
         ),
        body: Container(
          color: Colors.grey,
        ),
      ),
    );
  }

  // 按钮点击执行的代码
  _onBackTap(BuildContext context) {
    Navigator.of(context).pop(" 返回值 ");
  }

}

/// 定义一个页面，必须要传递参数，这个时候，不好进行配置了，因为JXAboutPage必须要求传入一个参数
/// 这个时候我们可以使用onGenerateRoute的钩子函数：
class JXAboutPage extends StatelessWidget {
  static const String routeName = "/about";
  final String message;

  const JXAboutPage({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("关于页面"),
      ),
      body: Center(
        child: Text(message, style: const TextStyle(fontSize: 30, color: Colors.red),),
      ),
    );
  }
}

class UnknownPage extends StatelessWidget {
  const UnknownPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("错误页面"),
      ),
      body: const Center(
        child: Text("页面跳转错误"),
      ),
    );
  }
}
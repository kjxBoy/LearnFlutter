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
      home: const MyHomePage(),
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
            )
          ],
        ),
      ),
    );
  }

  // 按钮点击执行的代码
  _onPushTap(BuildContext context) {
    final future = Navigator.of(context).push(
        MaterialPageRoute(
            builder: (ctx) {
              return const DetailPage();
            }
        )
    );

    future.then((value){
      setState(() {
        _message = value;
      });
    });
  }
}

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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

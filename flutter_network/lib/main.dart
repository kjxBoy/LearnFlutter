import 'dart:io';

import 'package:dio/adapter.dart';
import 'package:dio_proxy_plugin/dio_proxy_plugin.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

import 'MovieItem.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  static final Dio dio = Dio()
    ..options.baseUrl = "https://httpbin.org/"
    ..httpClientAdapter = HttpProxyAdapter(ipAddr: 'localhost', port: 8888);

  void _incrementCounter() {
      getNetworkData().then((response) {
          if (kDebugMode) {

            final movieItem = movieItemFromJson(response.toString());
            print(movieItem.subjectCollectionItems?.first);

          }
          setState(() {
            _counter++;
          });
      });
  }

  Future<Response> getNetworkData() async {
    if (kDebugMode) {
      print("测试proxy");
      //获取系统代理
      String deviceProxy = '';
      try {
        deviceProxy = await DioProxyPlugin.deviceProxy;
      } on PlatformException {
        deviceProxy = '';
        print('Failed to get system proxy.');
      }
      if (deviceProxy.isNotEmpty) {
        var arrProxy = deviceProxy.split(':');

        //设置dio proxy
        var httpProxyAdapter = HttpProxyAdapter(
            ipAddr: arrProxy[0],
            port: int.tryParse(arrProxy[1])!
        );
        dio.httpClientAdapter = httpProxyAdapter;
      }
    }

    var response = await dio.get("/get?a=2", queryParameters:{"id":12,"name":"wendu"}).then((value) {
      return value;
    });
    return response;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}


import 'package:dio/dio.dart';
import 'package:dio_proxy_plugin/dio_proxy_plugin.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:dio/dio.dart';
import 'package:flutter_network/MovieItem.dart';

class MovieRequest {
  static final Dio dio = Dio()
    ..options.baseUrl = "https://httpbin.org/"
    ..httpClientAdapter = HttpProxyAdapter(ipAddr: 'localhost', port: 8888);

  static Future<MovieItem> getNetworkData() async {
    // 主要为了抓包
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

    var response = await dio.get("/get?a=2").then((response) {
      final movieItem = movieItemFromJson(response.data.toString());
      return movieItem;
    });
    return response;
  }

}


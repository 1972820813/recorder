import 'dart:collection';

import 'package:dio/dio.dart';

class Network {
  static String baseUrl = "https://a.vormor.cn/";

  Map<String, String> map = HashMap();

  final dio = Dio(BaseOptions(
    connectTimeout: const Duration(milliseconds: 3000),
    sendTimeout: const Duration(milliseconds: 3000),
    receiveTimeout: const Duration(milliseconds: 10000),
    baseUrl: baseUrl,
    contentType: Headers.jsonContentType,
    headers: {
      "a": "Record-20240530",
      "l": "zh-CN",
      "v": "100",
      "tk": "",
      "ts": "${DateTime.now().millisecondsSinceEpoch ~/ 1000}",
      "n": "6TAbeO",
      "sign": "8ab3105c244683eadbfbb666ff7efc27",
      "c": "M-20240530",
      "tz": "Asia/Shanghai",
      "d": "2",
      "f": "202411090000003",
      "os": "M-20240530",
      "sv": "6.0",
    },
  ));

  Future post(String apiPath, {Object? data}) async {
    try {
      var response = await dio.post(apiPath, data: data);
      if (response.data != null) {
        return response.data;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}

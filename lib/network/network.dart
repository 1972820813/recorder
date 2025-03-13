import 'package:dio/dio.dart';
import 'package:project_recorder/util/constant_util.dart';
import 'package:project_recorder/util/shared_preference_util.dart';

class NetworkManager {
  static String baseUrl = "https://a.vormor.cn/";

  late Dio dio;

  static NetworkManager _instance = NetworkManager._network();

  static NetworkManager getInstance() {
    _instance = NetworkManager._network();
    return _instance;
  }

  NetworkManager._network() {
    dio = Dio(BaseOptions(
      connectTimeout: const Duration(milliseconds: 3000),
      sendTimeout: const Duration(milliseconds: 3000),
      receiveTimeout: const Duration(milliseconds: 10000),
      baseUrl: baseUrl,
      contentType: Headers.jsonContentType,
      headers: headers(),
    ));
  }

  static Map<String, String> headers() {
    Map<String, String> header = {
      "a": "Record-20240530",
      "l": "zh-CN",
      "v": "100",
      "tk": "",
      "ts": "${DateTime.now().millisecondsSinceEpoch ~/ 1000}",
      "n": "6TAbeO",
      "c": "M-20240530",
      "d": "2",
      "f": "202411090000001",
      "os": "M-20240530",
      "sv": "6.0",
    };
    var sign = _sign(header);
    header["sign"] = sign;
    header["tz"] = "Asia/Shanghai";
    return header;
  }

  static String _sign(Map<String, String> map) {
    List<String> list = map.keys.toList();
    list.sort();
    String str = "";
    for (int i = 0; i < list.length; i++) {
      str += "${list[i]}=${map[list[i]]}&";
    }
    str += "key=QDRgdOq7W8cj7HbwqSfGlysxlYstp6Gh";
    return ConstantUtil.generateMD5(str);
  }

  ///post请求
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

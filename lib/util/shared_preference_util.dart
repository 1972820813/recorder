import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceUtil {
  //存值
  static setData(String key, dynamic value) async {
    var sp = await SharedPreferences.getInstance();
    sp.setString(key, jsonEncode(value));
  }

  //取值
  static getData(String key) async {
    try {
      var sp = await SharedPreferences.getInstance();
      String? va = sp.getString(key);

      if (va != null) {
        return json.decode(va);
      } else {
        return null;
      }
    } catch (e) {
      return e.toString();
    }
  }

  //移除指定数据
  static removeData(String key) async {
    var sp = await SharedPreferences.getInstance();
    sp.remove(key);
  }

  //清除所有数据
  static clear() async {
    var sp = await SharedPreferences.getInstance();
    sp.clear();
  }
}

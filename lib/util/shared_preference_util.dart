
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceUtil {

  static setData(String key, value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (value is String) {
      prefs.setString(key, value);
    } else if (value is num) {
      prefs.setInt(key, value as int);
    } else if (value is double) {
      prefs.setDouble(key, value);
    } else if (value is bool) {
      prefs.setBool(key, value);
    } else if (value is List) {
      prefs.setStringList(key, value.cast<String>());
    }
  }

  // 获取
  static getData(String key, [dynamic replace]) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var data = prefs.get(key);
    return data ?? replace;
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

import 'package:flutter/material.dart';

class DoColors {
  static const Color theme =
      Color.fromRGBO(252, 90, 61, 1); //FC5A3D //立即购买，主题色等等
  static const Color yellow253 = Color.fromRGBO(253, 181, 131, 1);

  static const Color red251 = Color.fromRGBO(251, 239, 237, 1);
  static const Color yellow254 =
      Color.fromRGBO(254, 226, 208, 1); //门店右上角小标签，特殊的
  static const Color green39 = Color.fromRGBO(39, 186, 108, 1);

  ///渐变色
  static const Color yellowBegin = Color.fromRGBO(252, 201, 46, 1);
  static const Color yellowEnd = Color.fromRGBO(251, 158, 40, 1);
  static const Color redBegin = Color.fromRGBO(253, 110, 39, 1);
  static const Color redEnd = Color.fromRGBO(252, 67, 30, 1);

  ///标签相关
  // static const Color chipNormalGray = Color.fromRGBO(245, 244, 245, 1);
  static const Color chipSelectedBG = Color.fromRGBO(251, 239, 237, 1);
  static const Color white = Color.fromRGBO(255, 255, 255, 1);

  //static const Color black = Color(0xff000000);
  static const Color black0 = Color.fromRGBO(0, 0, 0, 1); //导航栏主标题
  static const Color black33 = Color.fromRGBO(33, 33, 33, 1);
  static const Color black51 = Color.fromRGBO(51, 51, 51, 1); //最常用的字体黑色，黑图标等
  static const Color black128 = Color.fromRGBO(51, 51, 51, 1); //最常用的字体黑色，黑图标等
  static const Color gray154 = Color.fromRGBO(154, 154, 154, 1); //灰的字
  static const Color gray168 = Color.fromRGBO(168, 168, 168, 1);
  static const Color gray186 = Color.fromRGBO(186, 186, 186, 1); //最灰的字
  static const Color gray238 = Color.fromRGBO(238, 238, 238, 1);
  static const Color gray249 = Color.fromRGBO(249, 249, 249, 1);
  static const Color gray102 = Color.fromRGBO(102, 102, 102, 1);
  static const Color gray153 = Color.fromRGBO(153, 153, 153, 1);
  static const Color gray39 = Color.fromRGBO(39, 39, 39, 1);
  static const Color gray40 = Color.fromRGBO(40, 40, 40, 1);

  static const Color customColor = Color.fromRGBO(16, 177, 167, 1);
  static const Color mainTabBackground = Color.fromRGBO(19, 19, 19, 1);
  static const Color white85 = Color.fromRGBO(255, 255, 255, 0.85);
  static const Color white60 = Color.fromRGBO(255, 255, 255, 0.60);
  static const Color black28 = Color.fromRGBO(28, 28, 28, 1);
  static const Color vipTextColor = Color.fromRGBO(61, 41, 12, 1);
  static const Color settingItemBg = Color.fromRGBO(18, 18, 18, 1);
  static const Color dividerLineColor = Color.fromRGBO(43, 43, 46, 1);

  ///颜色值转换
  static Color string2Color(String colorString) {
    int? value = 0x00000000;
    if (colorString.isNotEmpty) {
      if (colorString[0] == '#') {
        colorString = colorString.substring(1);
      }
      value = int.tryParse(colorString, radix: 16);
      if (value != null) {
        if (value < 0xFF000000) {
          value += 0xFF000000;
        }
      }
    }
    return Color(value!);
  }
}

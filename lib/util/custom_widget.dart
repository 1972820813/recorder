import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_recorder/util/app_screenAdapter.dart';

import 'app_colors.dart';

///通用app bar
Widget customBar(String title) {
  return Container(
    height: 45,
    color: DoColors.black0,
    child: Row(
      children: [
        commonTitle(), // 50宽度
        commonText(title, color: DoColors.white85, fontSize: 16)
      ],
    ),
  );
}

///
Widget customTitleCenterBar(String title) {
  return Container(
    width: DoScreenAdapter.screenW(),
    height: 45,
    color: DoColors.black0,
    child: Stack(
      alignment: Alignment.center,
      children: [
        Positioned(left: 0, child: commonTitle()),
        commonText(title, color: DoColors.white85, fontSize: 16)
      ],
    ),
  );
}

///通用头布局
Widget commonTitle() {
  return commonClickImage("assets/images/icon_custom_back.png",
      width: 30, height: 20, onTap: () {
    Get.back();
  });
}

///通用可点击Text
Widget commonClickText(String message,
    {Color? color,
    double? fontSize,
    TextDecoration? decoration,
    Color? decorationColor,
    VoidCallback? onTap}) {
  return InkWell(
    onTap: onTap,
    child: commonText(message,
        color: color,
        fontSize: fontSize,
        decoration: decoration,
        decorationColor: decorationColor),
  );
}

///通用Text
Widget commonText(String message,
    {Color? color,
    double? fontSize,
    TextDecoration? decoration,
    Color? decorationColor}) {
  return Text(
    message,
    style: TextStyle(
        color: color ?? DoColors.mainTabBackground,
        fontSize: fontSize ?? 20,
        decoration: decoration,
        decorationColor: decorationColor),
  );
}

///通用可点击image
Widget commonClickImage(String name,
    {double? width, double? height, VoidCallback? onTap}) {
  return InkWell(
    onTap: onTap,
    child: commonImage(name, width: width, height: height),
  );
}

///通用image
Widget commonImage(String name, {double? width, double? height}) {
  return Image.asset(name, width: width, height: height);
}

///通用组件，间隔
Widget commonSizedBox({double? width, double? height}) {
  return SizedBox(width: width, height: height);
}

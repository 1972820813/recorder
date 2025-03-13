import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_recorder/util/app_screenAdapter.dart';

import 'app_colors.dart';

Widget customBar(String title) {
  return Container(
    height: 45,
    color: DoColors.black0,
    child: Row(
      children: [
        InkWell(
          onTap: () {
            Get.back();
          },
          child: Image.asset(
            "assets/images/icon_custom_back.png",
            width: 40,
            height: 18,
          ),
        ), // 50宽度
        Text(
          title,
          style: const TextStyle(fontSize: 16, color: DoColors.white85),
        ),
      ],
    ),
  );
}

Widget customTitleCenterBar(String title) {
  return Container(
    width: DoScreenAdapter.screenW(),
    height: 45,
    color: DoColors.black0,
    child: Stack(
      alignment: Alignment.center,
      children: [
        Positioned(
          left: 0,
          child: InkWell(
            onTap: () {
              Get.back();
            },
            child: Image.asset(
              "assets/images/icon_custom_back.png",
              width: 40,
              height: 18,
            ),
          ),
        ),
        // 50宽度
        Text(
          title,
          style: const TextStyle(fontSize: 16, color: DoColors.white85),
        ),
      ],
    ),
  );
}

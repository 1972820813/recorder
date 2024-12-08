import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app_colors.dart';

Widget customBar(String title) {
  return Container(
    height: 45,
    color: DoColors.black28,
    child: Row(
      children: [
        const SizedBox(width: 6), // 50宽度
        InkWell(
          onTap: () {
            Get.back();
          },
          child: Image.asset(
            "assets/images/icon_custom_back.png",
            width: 18,
          ),
        ),
        const SizedBox(width: 6), // 50宽度
        Text(
          title,
          style: const TextStyle(fontSize: 16, color: DoColors.white85),
        ),
      ],
    ),
  );
}
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_recorder/model/home/record/record_page.dart';
import 'package:project_recorder/util/app_colors.dart';
import 'package:project_recorder/util/app_screenAdapter.dart';
import 'package:project_recorder/util/constant_util.dart';
import 'package:project_recorder/util/custom_widget.dart';

import 'language_page_controller.dart';

class LanguagePage extends GetView<LanguagePageController> {
  static const routeName = "/language_page";

  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Obx(() => Container(
        width: DoScreenAdapter.screenW(),
        height: DoScreenAdapter.screenH(),
        color: DoColors.black0,
        child: Stack(children: [
          const SizedBox(
            height: 40,
          ),
          customBar(controller.pageTitle.value),
          Positioned(
            bottom: 0,
            child: Container(
              color: DoColors.gray39,
              width: DoScreenAdapter.screenW(),
              height: 84,
              alignment: Alignment.center,
              child: commonClickImage("assets/images/res_img_voice.png",
                  width: 60, height: 60, onTap: () {
                Get.toNamed(RecordPage.routeName, arguments: {
                  ConstantUtil.languageName: controller.languageName.value
                });
              }),
            ),
          ),
        ])));
  }
}

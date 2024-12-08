import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_recorder/util/app_colors.dart';

import 'trans_setting_page_controller.dart';

class TransSettingPage extends GetView<TransSettingPageController> {
  static const routeName = "/trans_setting_page";

  const TransSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const Text(
      "转写设置",
      style: TextStyle(color: DoColors.customColor),
    );
  }
}

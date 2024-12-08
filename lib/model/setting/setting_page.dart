import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../util/app_colors.dart';
import 'setting_page_controller.dart';

class SettingPage extends GetView<SettingPageController> {
  static const routeName = "/setting_page";

  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const Center(
      child: Text(
        "设置",
        style: TextStyle(color: DoColors.customColor),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_recorder/util/app_colors.dart';

import 'language_page_controller.dart';

class LanguagePage extends GetView<LanguagePageController> {
  static const routeName = "/language_page";

  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const Text(
      "选择语言",
      style: TextStyle(color: DoColors.customColor),
    );
  }
}

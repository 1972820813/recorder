import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_recorder/util/app_colors.dart';

import 'record_page_controller.dart';

class RecordPage extends GetView<RecordPageController> {
  static const routeName = "/record_page";

  const RecordPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const Text(
      "录音页面",
      style: TextStyle(color: DoColors.customColor),
    );
  }
}

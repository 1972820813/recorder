import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_recorder/util/app_colors.dart';

import 'tool_page_controller.dart';

class ToolPage extends GetView<ToolPageController> {
  static const routeName = "/tool_page";

  const ToolPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const Center(
      child: Text(
        "工具",
        style: TextStyle(color: DoColors.customColor),
      ),
    );
  }
}

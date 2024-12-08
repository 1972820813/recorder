import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../util/app_colors.dart';
import 'file_page_controller.dart';

class FilePage extends GetView<FilePageController> {
  static const routeName = "/file_page";

  const FilePage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const Center(
      child: Text(
        "文件",
        style: TextStyle(color: DoColors.customColor),
      ),
    );
  }
}

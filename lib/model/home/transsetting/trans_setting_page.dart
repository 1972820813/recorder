import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_recorder/util/app_colors.dart';
import 'package:project_recorder/util/custom_widget.dart';

import 'trans_setting_page_controller.dart';

class TransSettingPage extends GetView<TransSettingPageController> {
  static const routeName = "/trans_setting_page";

  const TransSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Obx(() => Container(
          color: DoColors.black28,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              customBar(controller.pageTitle.value),
            ],
          ),
        ));
  }
}

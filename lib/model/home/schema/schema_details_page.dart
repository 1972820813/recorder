import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_recorder/util/app_colors.dart';

import '../../../util/custom_widget.dart';
import 'schema_details_page_controller.dart';

class SchemaDetailsPage extends GetView<SchemaDetailsPageController> {
  const SchemaDetailsPage({super.key});

  static const routeName = "/schema_details_page";

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SchemaDetailsPageController());
    // TODO: implement build
    return Obx(() => Container(
          color: DoColors.black0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customBar(controller.pageTitle.value),
              _contentView(controller.modeIntroduction.value,
                  controller.modeContent1.value),
              commonSizedBox(height: 20),
              _contentView(controller.micIntroduction.value,
                  controller.modeContent2.value),
              commonSizedBox(height: 20),
              _contentView(controller.placementIntroduction.value,
                  controller.modeContent3.value),
            ],
          ),
        ));
  }

  Widget _contentView(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _contentDetail(title, DoColors.white85),
        _contentDetail(content, DoColors.gray102),
      ],
    );
  }

  Widget _contentDetail(String message, Color color) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
      child: commonText(message, fontSize: 18, color: color),
    );
  }
}

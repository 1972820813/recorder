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
          color: DoColors.black28,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
              ),
              customBar(controller.pageTitle.value),
              _contentView(controller.modeIntroduction.value,
                  controller.modeContent1.value),
              const SizedBox(
                height: 10,
              ),
              _contentView(controller.micIntroduction.value,
                  controller.modeContent2.value),
              const SizedBox(
                height: 10,
              ),
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
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
          child: Text(
            title,
            style: const TextStyle(fontSize: 18, color: DoColors.white85),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
          child: Text(
            content,
            style: const TextStyle(fontSize: 18, color: DoColors.gray102),
          ),
        ),
      ],
    );
  }
}

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
              _contentView("一、模式简介", "通用模式适用于绝大多数录音场景，如课堂、发布会等。"),
              const SizedBox(
                height: 10,
              ),
              _contentView("二、麦克风工作", "定向麦克和阵列麦克同时收音，通过算法进行智能降噪优化，录音效果相对均衡。"),
              const SizedBox(
                height: 10,
              ),
              _contentView("三、摆放建议", "建议将定向麦克对准声源。"),
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

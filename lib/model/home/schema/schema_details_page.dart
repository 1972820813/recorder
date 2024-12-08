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
              customBar(controller.pageTitle.value),
            ],
          ),
        ));
  }
}

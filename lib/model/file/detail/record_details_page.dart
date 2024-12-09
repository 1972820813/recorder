import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_recorder/util/app_colors.dart';
import 'package:project_recorder/util/custom_widget.dart';

import 'record_details_page_controller.dart';

class RecordDetailsPage extends GetView<RecordDetailsPageController> {
  const RecordDetailsPage({super.key});

  static const routeName = "/record_details_page";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Obx(() => Container(
          color: DoColors.black0,
          child: customBar(controller.pageTitle.value),
        ));
  }
}

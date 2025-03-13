import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_recorder/model/setting/ble/ble_page_controller.dart';
import 'package:project_recorder/util/app_colors.dart';
import 'package:project_recorder/util/custom_widget.dart';

class BlePage extends GetView<BlePageController> {
  static const String routeName = "/ble_page";

  const BlePage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Obx(() => Container(
          color: DoColors.black0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customBar(controller.pageTitle.value),
            ],
          ),
        ));
  }
}

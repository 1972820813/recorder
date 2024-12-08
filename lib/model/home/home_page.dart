import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_recorder/model/home/home_page_controller.dart';

import '../../util/app_colors.dart';

class HomePage extends GetView<HomePageController> {
  static const routeName = "/home_page";

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HomePageController());
    // TODO: implement build
    return Obx(() => Scaffold(
          body: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 50, 0, 0),
                child: Text(
                  "${controller.dateTime.value.hour}:${controller.dateTime.value.minute}",
                  style: const TextStyle(fontSize: 48, color: DoColors.white85),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 110, 0, 0),
                child: Text(
                  "${controller.dateTime.value.month}月${controller.dateTime.value.day}日",
                  style: const TextStyle(fontSize: 18, color: DoColors.white85),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(6, 180, 6, 0),
                child: PageView(
                  controller: controller.pageController,
                  children: controller.chilePages,
                ),
              ),
            ],
          ),
        ));
  }
}

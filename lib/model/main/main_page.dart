import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../util/app_colors.dart';
import 'main_page_controller.dart';

class MainPage extends GetView<MainPageController> {
  static const routeName = "/main_page";

  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: PageView(
            physics: const NeverScrollableScrollPhysics(), //禁止PageView滑动
            controller: controller.pageController,
            children: controller.pages,
            onPageChanged: (index) {},
          ),
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: DoColors.mainTabBackground,
            type: BottomNavigationBarType.fixed,
            currentIndex: controller.currentIndex.value,
            selectedItemColor: DoColors.customColor,
            unselectedItemColor: Colors.grey,
            selectedFontSize: 14,
            unselectedFontSize: 14,
            onTap: (index) {
              controller.setCurrentIndex(index);
              controller.pageController.jumpToPage(index);
            },
            items: [
              BottomNavigationBarItem(
                  icon: controller
                      .mainTabIcon("assets/images/res_icon_normal_record.png"),
                  activeIcon: controller
                      .mainTabIcon("assets/images/res_icon_select_record.png"),
                  label: "录音"),
              BottomNavigationBarItem(
                  icon: controller
                      .mainTabIcon("assets/images/res_icon_normal_files.png"),
                  activeIcon: controller
                      .mainTabIcon("assets/images/res_icon_select_files.png"),
                  label: "文件"),
              BottomNavigationBarItem(
                  icon: controller
                      .mainTabIcon("assets/images/res_img_ai_default.png"),
                  activeIcon: controller
                      .mainTabIcon("assets/images/res_img_ai_selected.png"),
                  label: "AI"),
              BottomNavigationBarItem(
                  icon: controller
                      .mainTabIcon("assets/images/res_img_setting_default.png"),
                  activeIcon: controller.mainTabIcon(
                      "assets/images/res_img_setting_selected.png"),
                  label: "设置"),
            ],
          ),
        ));
  }
}

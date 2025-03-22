import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
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
              _bottomNavigationBarItem(
                  "录音",
                  "assets/images/res_icon_normal_record.png",
                  "assets/images/res_icon_select_record.png"),
              _bottomNavigationBarItem(
                  "文件",
                  "assets/images/res_icon_normal_files.png",
                  "assets/images/res_icon_select_files.png"),
              _bottomNavigationBarItem(
                  "AI",
                  "assets/images/res_img_ai_default.png",
                  "assets/images/res_img_ai_selected.png"),
              _bottomNavigationBarItem(
                  "设置",
                  "assets/images/res_img_setting_default.png",
                  "assets/images/res_img_setting_selected.png")
            ],
          ),
        ));
  }

  BottomNavigationBarItem _bottomNavigationBarItem(
      String content, String defaultIconPath, String activateIconPath) {
    return BottomNavigationBarItem(
        icon: controller.mainTabIcon(defaultIconPath),
        activeIcon: controller.mainTabIcon(activateIconPath),
        label: content);
  }
}

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:project_recorder/model/file/file_page.dart';
import 'package:project_recorder/model/home/home_page.dart';
import 'package:project_recorder/model/setting/setting_page.dart';
import 'package:project_recorder/model/tool/tool_page.dart';

class MainPageController extends GetxController {
  RxInt currentIndex = 0.obs;

  PageController pageController = Get.arguments == null
      ? PageController(initialPage: 0)
      : PageController(initialPage: Get.arguments["initialPage"]);

  List<Widget> pages = [
    const HomePage(),
    const FilePage(),
    const ToolPage(),
    const SettingPage(),
  ];

  void setCurrentIndex(index) {
    currentIndex.value = index;
    update();
  }

  //设置主页icon
  Image mainTabIcon(String path) {
    return Image.asset(
      path,
      width: 24,
      height: 24,
    );
  }
}

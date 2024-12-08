import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'home_child_view_page/home_chile_page.dart';

class HomePageController extends GetxController {
  PageController pageController = Get.arguments == null
      ? PageController(initialPage: 0)
      : PageController(initialPage: Get.arguments["initialPage"]);

  //当前时间
  Rx<DateTime> dateTime = DateTime.now().obs;

  late Timer timer;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    setHomePage();

    //定时器
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      dateTime.value = DateTime.now();
    });
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    if (timer.isActive) {
      timer.cancel();
    }
  }

  List<Widget> chilePages = [];

  void setHomePage() {
    chilePages.add(const HomeChildPage("通用模式", "通用，兼容性最好，声音还原度高", 0));
    chilePages.add(const HomeChildPage("会议模式", "适用多人会议、论坛，捕获声音范围更广", 1));
    chilePages.add(const HomeChildPage("采访模式", "适用面对面访谈、街头访问", 2));
    chilePages.add(const HomeChildPage("演讲模式", "上课、讲座专用，捕获声音范围更广", 3));
  }
}

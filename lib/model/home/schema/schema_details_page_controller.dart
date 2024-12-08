import 'package:get/get.dart';

class SchemaDetailsPageController extends GetxController {
  Rx<String> pageTitle = "通用模式".obs;

  int currentPageIndex =
      Get.arguments != null ? Get.arguments["home_child_page_index"] : 0;

  void updatePageInfo() {
    switch (currentPageIndex) {
      case 0:
        pageTitle.value = "通用模式";
        break;
      case 1:
        pageTitle.value = "会议模式";
        break;
      case 2:
        pageTitle.value = "采访模式";
        break;
      case 3:
        pageTitle.value = "演讲模式";
        break;
    }
  }
}

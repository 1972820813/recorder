import 'package:get/get.dart';
import 'package:project_recorder/util/constant_util.dart';

class LanguagePageController extends GetxController {
  RxString pageTitle = "选择语言".obs;
  RxString buttonText = "按钮".obs;
  RxString languageName = "中英文".obs;
  RxInt recordMode =
      (Get.arguments != null ? Get.arguments[ConstantUtil.recordMode] : 0)
          .obs;
}

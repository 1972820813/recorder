import 'package:get/get.dart';
import 'package:project_recorder/util/constant_util.dart';

class RecordPageController extends GetxController {
  RxString pageTitle = "中英文".obs;

  RxString languageName =
      (Get.arguments != null ? Get.arguments[ConstantUtil.languageName] : "中英文")
          .obs;
}

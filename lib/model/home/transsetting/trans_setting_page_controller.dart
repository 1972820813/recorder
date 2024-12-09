import 'package:get/get.dart';

class TransSettingPageController extends GetxController {
  Rx<String> pageTitle = "转写设置".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    pageTitle.value = "转写设置";
  }
}

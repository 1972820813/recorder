import 'package:get/get.dart';
import 'trans_setting_page_controller.dart';

class TransSettingPageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => TransSettingPageController());
  }
}
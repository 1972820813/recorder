import 'package:get/get.dart';
import 'package:project_recorder/model/setting/wifi/wifi_page_controller.dart';

class WifiPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WifiPageController());
  }
}

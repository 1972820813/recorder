import 'package:get/get.dart';
import 'package:project_recorder/model/setting/ble/ble_page_controller.dart';

class BlePageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => BlePageController());
  }
}
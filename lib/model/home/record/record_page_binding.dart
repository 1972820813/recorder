import 'package:get/get.dart';
import 'package:project_recorder/model/home/record/record_page_controller.dart';

class RecordPageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => RecordPageController());
  }
}
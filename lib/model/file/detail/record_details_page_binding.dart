import 'package:get/get.dart';

import 'record_details_page_controller.dart';

class RecordDetailsPageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => RecordDetailsPageController());
  }

}
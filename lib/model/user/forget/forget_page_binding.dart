import 'package:get/get.dart';

import 'forget_page_controller.dart';

class ForgetPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgetPageController());
  }
}

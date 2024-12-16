import 'package:get/get.dart';
import 'package:project_recorder/model/account/forget/forget_page_controller.dart';


class ForgetPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgetPageController());
  }
}

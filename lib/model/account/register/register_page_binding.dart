import 'package:get/get.dart';
import 'package:project_recorder/model/account/register/register_page_controller.dart';


class RegisterPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterPageController());
  }
}

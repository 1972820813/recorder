import 'package:get/get.dart';
import 'package:project_recorder/model/account/login/login_page_controller.dart';


class LoginPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginPageController());
  }
}

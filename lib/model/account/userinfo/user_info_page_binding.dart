import 'package:get/get.dart';
import 'package:project_recorder/model/account/userinfo/user_info_page_controller.dart';

class UserInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UserInfoPageController());
  }
}

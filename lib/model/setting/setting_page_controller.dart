import 'package:get/get.dart';

class SettingPageController extends GetxController {
  Rx<String> loginStatus = "立即登录".obs;
  RxBool isLogin = false.obs;
  Rx<String> avatarAddress = "".obs;
  Rx<String> signInNow = "立即登录".obs;
  Rx<String> vipTitle = "小贝会员".obs;

}

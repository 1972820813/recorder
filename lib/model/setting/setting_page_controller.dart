import 'package:get/get.dart';
import 'package:project_recorder/util/constant_util.dart';
import 'package:project_recorder/util/shared_preference_util.dart';

import '../../network/network.dart';

class SettingPageController extends GetxController {
  Rx<String> loginStatus = "立即登录".obs;
  RxBool isLogin = false.obs;
  Rx<String> avatarAddress = "".obs;
  Rx<String> signInNow = "立即登录".obs;
  Rx<String> vipTitle = "小贝会员".obs;
  Rx<int> position = 0.obs;
  Rx<String> userToken = "".obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // checkUserToken();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  checkUserToken() {
    var token = SharedPreferenceUtil.getData(ConstantUtil.KEY_TOKEN);
    if (token == null) {
      return false;
    } else {
      if (userToken.value != token) {
        userToken.value = token;
      }
      return true;
    }
  }

  ///获取个人信息
  profile() {
    // NetworkManager.getInstance().post("apiPath");
    print("alex 登录完成后的回调");
  }
}

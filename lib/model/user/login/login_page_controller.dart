import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_recorder/network/network.dart';
import 'package:project_recorder/util/app_colors.dart';

class LoginPageController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();

  OutlineInputBorder customBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: const BorderSide(style: BorderStyle.none));

  Rx<String> iconLoginPwdHint = "assets/images/res_icon_hint.png".obs;
  Rx<bool> isShowPassword = false.obs;
  Rx<String> loginEmail = "".obs;
  Rx<String> loginPassword = "".obs;
  Rx<bool> isAgreementChecked = false.obs;

  ///登录api请求
  login() async {
    if (loginEmail.isEmpty) {
      Get.snackbar("提示信息", "请填写邮箱地址", backgroundColor: DoColors.white85);
      return;
    }
    if (!loginEmail.value.isEmail) {
      Get.snackbar("提示信息", "请填写正确的邮箱地址:${loginEmail.value}",
          backgroundColor: DoColors.white85);
      return;
    }
    if (loginPassword.isEmpty) {
      Get.snackbar("提示信息", "请填写密码", backgroundColor: DoColors.white85);
      return;
    }
    if (!isAgreementChecked.value) {
      Get.defaultDialog(
          title: "警示信息",
          content: const Text(
            "请勾选协议",
            style: TextStyle(fontSize: 18, color: DoColors.white85),
          ));
      return;
    }

    var data = await Network().post("/api/login/password",
        data: {"account": loginEmail.value, "pwd": loginPassword.value});
    print(
        "${data.toString()}        --->${loginEmail.value}   --->${loginPassword.value}   ${DateTime.now().millisecond}");
  }
}

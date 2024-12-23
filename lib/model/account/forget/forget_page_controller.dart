import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_recorder/entity/response_entity.dart';
import 'package:project_recorder/network/network.dart';
import 'package:project_recorder/util/constant_util.dart';

import '../../../util/app_colors.dart';

class ForgetPageController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();
  TextEditingController veryCodeController = TextEditingController();

  OutlineInputBorder customBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: const BorderSide(style: BorderStyle.none));
  Rx<bool> isShowPassword = true.obs;
  Rx<String> accountEmail = "".obs;
  Rx<String> newPassword = "".obs;
  Rx<String> veryCode = "".obs;
  Rx<String> iconForgetPwdHint = "assets/images/res_icon_hint.png".obs;
  Rx<bool> isAcquireVeryCode = false.obs;
  Rx<String> veryCodeHing = "获取".obs;
  int countDownTime = 60;

  ///获取验证码
  getVeryCode() async {
    if (accountEmail.isEmpty) {
      Get.snackbar("提示信息", "请填写邮箱地址", backgroundColor: DoColors.white85);
      return;
    }

    if (!accountEmail.value.isEmail) {
      Get.snackbar("提示信息", "请填写正确的邮箱地址:${accountEmail.value}",
          backgroundColor: DoColors.white85);
      return;
    }
    startCountDownTime();
    await NetworkManager.getInstance().post("/api/captcha",
        data: {"account": accountEmail.value, "sms_type": 3});
  }

  Timer? _timer;

  startCountDownTime() {
    if (countDownTime != 60) {
      return;
    }

    if (countDownTime > 0) {
      _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
        if (countDownTime > 0) {
          isAcquireVeryCode.value = true;
          countDownTime--;
          veryCodeHing.value = "${countDownTime}s";
        } else {
          destroyTimer();
          veryCodeHing.value = "获取";
          isAcquireVeryCode.value = false;
        }
      });
    } else {
      veryCodeHing.value = "获取";
      isAcquireVeryCode.value = false;
    }
  }

  ///找回密码
  forget() async {
    if (accountEmail.isEmpty) {
      Get.snackbar("提示信息", "请填写邮箱地址", backgroundColor: DoColors.white85);
      return;
    }

    if (!accountEmail.value.isEmail) {
      Get.snackbar("提示信息", "请填写正确的邮箱地址:${accountEmail.value}",
          backgroundColor: DoColors.white85);
      return;
    }

    if (veryCode.value.isEmpty) {
      Get.snackbar("提示信息", "请填写验证码", backgroundColor: DoColors.white85);
      return;
    }

    if (veryCode.value.length < 4) {
      Get.snackbar("提示信息", "请填写正确的验证", backgroundColor: DoColors.white85);
      return;
    }

    if (newPassword.isEmpty) {
      Get.snackbar("提示信息", "请填写密码", backgroundColor: DoColors.white85);
      return;
    }
    if (newPassword.value.length < 6) {
      Get.snackbar("提示信息", "密码不得少于6位", backgroundColor: DoColors.white85);
      return;
    }
    var data =
        await NetworkManager.getInstance().post("/api/forgot/password", data: {
      "account": accountEmail.value,
      "code": veryCode.value,
      "pwd": ConstantUtil.generateMD5(newPassword.value)
    });
    print(jsonEncode(data));
    var fromJson = ResponseEntity.fromJson(data);
    if (fromJson.code == 0) {
      Get.back();
    }
  }

  destroyTimer() {
    _timer?.cancel();
    _timer = null;
    countDownTime = 60;
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    destroyTimer();
  }
}

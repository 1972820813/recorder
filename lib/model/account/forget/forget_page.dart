import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:project_recorder/util/app_colors.dart';
import 'package:project_recorder/util/app_screenAdapter.dart';
import 'package:project_recorder/util/custom_widget.dart';

import 'forget_page_controller.dart';

class ForgetPage extends GetView<ForgetPageController> {
  static const String routeName = "/forget_page";

  const ForgetPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Obx(
      () => Container(
          color: DoColors.black0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customBar(""),
              const SizedBox(
                height: 30,
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(12, 30, 0, 0),
                child: const Text(
                  "重置密码",
                  style: TextStyle(fontSize: 24, color: DoColors.white85),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                  margin: const EdgeInsets.fromLTRB(12, 12, 12, 0),
                  height: 50,
                  child: TextFormField(
                    style: const TextStyle(fontSize: 19, color: DoColors.white),
                    autofocus: true,
                    cursorColor: DoColors.white85,
                    controller: controller.emailController,
                    decoration: InputDecoration(
                      border: controller.customBorder,
                      enabledBorder: controller.customBorder,
                      focusedBorder: controller.customBorder,
                      focusedErrorBorder: controller.customBorder,
                      errorBorder: controller.customBorder,
                      hintText: "邮箱",
                      filled: true,
                      fillColor: DoColors.black28,
                      //隐藏下划线
                      //border: InputBorder.none,
                      hintStyle: const TextStyle(
                          fontSize: 19, color: DoColors.gray102),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 12, horizontal: 12),
                    ),
                    // 校验用户名,校验成功返回null，失败则返回错误信息
                    validator: (value) {
                      return value!.trim().isNotEmpty ? null : "邮箱不能为空";
                    },
                    onChanged: (value) {
                      controller.accountEmail.value = value;
                    },
                  )),
              Stack(
                children: [
                  Container(
                      margin: const EdgeInsets.fromLTRB(12, 12, 12, 0),
                      height: 50,
                      child: TextFormField(
                        style: const TextStyle(
                            fontSize: 19, color: DoColors.white),
                        autofocus: true,
                        cursorColor: DoColors.white85,
                        controller: controller.veryCodeController,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(6) //限制长度
                        ],
                        decoration: InputDecoration(
                          border: controller.customBorder,
                          enabledBorder: controller.customBorder,
                          focusedBorder: controller.customBorder,
                          focusedErrorBorder: controller.customBorder,
                          errorBorder: controller.customBorder,
                          hintText: "验证码",
                          filled: true,
                          fillColor: DoColors.black28,
                          //隐藏下划线
                          //border: InputBorder.none,
                          hintStyle: const TextStyle(
                              fontSize: 19, color: DoColors.gray102),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 12),
                        ),
                        // 校验用户名,校验成功返回null，失败则返回错误信息
                        validator: (value) {
                          return value!.trim().isNotEmpty ? null : "验证码不能为空";
                        },
                        onChanged: (value) {
                          controller.veryCode.value = value;
                        },
                      )),
                  Container(
                      alignment: Alignment.centerRight,
                      height: 50,
                      margin: const EdgeInsets.only(right: 24, top: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 10, top: 4),
                            width: 1,
                            height: 22,
                            color: DoColors.gray102,
                          ),
                          InkWell(
                            onTap: () {
                              controller.getVeryCode;
                            },
                            child: Text(
                              controller.veryCodeHing.value,
                              style: TextStyle(
                                  fontSize: 19,
                                  color: controller.isAcquireVeryCode.value
                                      ? DoColors.customColor
                                      : DoColors.gray102),
                            ),
                          ),
                        ],
                      )),
                ],
              ),
              Stack(
                children: [
                  Container(
                      margin: const EdgeInsets.fromLTRB(12, 12, 12, 0),
                      height: 50,
                      child: TextFormField(
                        style: const TextStyle(
                            fontSize: 19, color: DoColors.white),
                        autofocus: true,
                        cursorColor: DoColors.white85,
                        obscureText: controller.isShowPassword.value,
                        controller: controller.pwdController,
                        decoration: InputDecoration(
                          border: controller.customBorder,
                          enabledBorder: controller.customBorder,
                          focusedBorder: controller.customBorder,
                          focusedErrorBorder: controller.customBorder,
                          errorBorder: controller.customBorder,
                          hintText: "密码",
                          filled: true,
                          fillColor: DoColors.black28,
                          //隐藏下划线
                          //border: InputBorder.none,
                          hintStyle: const TextStyle(
                              fontSize: 19, color: DoColors.gray102),
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 12, horizontal: 12),
                        ),
                        // 校验用户名,校验成功返回null，失败则返回错误信息
                        validator: (value) {
                          return value!.trim().isNotEmpty ? null : "密码不能为空";
                        },
                        onChanged: (value) {
                          controller.newPassword.value = value;
                        },
                      )),
                  Container(
                      alignment: Alignment.centerRight,
                      height: 50,
                      margin: const EdgeInsets.only(right: 24, top: 12),
                      child: InkWell(
                        onTap: () {
                          controller.isShowPassword.value =
                              !controller.isShowPassword.value;

                          controller.isShowPassword.value
                              ? controller.iconForgetPwdHint.value =
                                  "assets/images/res_icon_hint.png"
                              : controller.iconForgetPwdHint.value =
                                  "assets/images/res_icon_show.png";
                        },
                        child: Image.asset(
                          controller.iconForgetPwdHint.value,
                          height: 20,
                          width: 20,
                        ),
                      ))
                ],
              ),
              InkWell(
                onTap: () {
                  controller.forget;
                },
                child: Container(
                    margin: const EdgeInsets.only(right: 12, left: 12, top: 30),
                    height: 50,
                    alignment: Alignment.center,
                    width: DoScreenAdapter.screenW(),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: DoColors.customColor),
                    child: const Text(
                      "确定",
                      style: TextStyle(fontSize: 18, color: DoColors.white85),
                    )),
              ),
            ],
          )),
    );
  }
}

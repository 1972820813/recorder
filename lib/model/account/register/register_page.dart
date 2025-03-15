import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:project_recorder/model/account/register/register_page_controller.dart';
import 'package:project_recorder/model/webView/cumstom_web_view.dart';
import 'package:project_recorder/util/app_colors.dart';
import 'package:project_recorder/util/custom_widget.dart';

import '../../../util/app_screenAdapter.dart';

class RegisterPage extends GetView<RegisterPageController> {
  static const String routeName = "/register_page";

  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Obx(
      () => Stack(
        children: [
          Container(
              color: DoColors.black0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  customBar(""),
                  commonSizedBox(height: 30),
                  Container(
                    padding: const EdgeInsets.fromLTRB(12, 30, 0, 0),
                    child: commonText("注册账号",
                        fontSize: 24, color: DoColors.white85),
                  ),
                  commonSizedBox(height: 50),
                  Container(
                      margin: const EdgeInsets.fromLTRB(12, 12, 12, 0),
                      height: 50,
                      child: TextFormField(
                        style: const TextStyle(
                            fontSize: 19, color: DoColors.white),
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
                              return value!.trim().isNotEmpty
                                  ? null
                                  : "验证码不能为空";
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
                                margin:
                                    const EdgeInsets.only(right: 10, top: 4),
                                width: 1,
                                height: 22,
                                color: DoColors.gray102,
                              ),
                              commonClickText(controller.veryCodeHing.value,
                                  fontSize: 19,
                                  color: controller.isAcquireVeryCode.value
                                      ? DoColors.customColor
                                      : DoColors.gray102, onTap: () {
                                controller.getVeryCode();
                              })
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
                          child: commonClickImage(
                              controller.iconForgetPwdHint.value,
                              height: 20,
                              width: 20, onTap: () {
                            controller.isShowPassword.value =
                                !controller.isShowPassword.value;

                            controller.isShowPassword.value
                                ? controller.iconForgetPwdHint.value =
                                    "assets/images/res_icon_hint.png"
                                : controller.iconForgetPwdHint.value =
                                    "assets/images/res_icon_show.png";
                          }))
                    ],
                  ),
                  InkWell(
                    onTap: () {
                      controller.register();
                    },
                    child: Container(
                        margin:
                            const EdgeInsets.only(right: 12, left: 12, top: 30),
                        height: 50,
                        alignment: Alignment.center,
                        width: DoScreenAdapter.screenW(),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: DoColors.customColor),
                        child: commonText("确定",
                            fontSize: 18, color: DoColors.white85)),
                  ),
                ],
              )),
          Container(
            alignment: Alignment.bottomCenter,
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                commonSizedBox(width: 12),
                InkWell(
                  onTap: () {
                    controller.isAgreementChecked.value =
                        !controller.isAgreementChecked.value;
                  },
                  child: controller.isAgreementChecked.value
                      ? Image.asset(
                          "assets/images/res_icon_agreement_checked.png",
                          height: 20,
                          width: 20,
                        )
                      : Padding(
                          padding: const EdgeInsets.all(0),
                          child: Container(
                            width: 20,
                            height: 20,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: DoColors.white60, width: 0.5),
                                borderRadius: BorderRadius.circular(2)),
                            child: const Text(""),
                          ),
                        ),
                ),
                commonSizedBox(width: 4),
                commonClickText("同意", color: DoColors.white60, fontSize: 14),
                commonClickText("《服务协议》",
                    color: DoColors.customColor, fontSize: 14, onTap: () {
                  Get.toNamed(CustomWebView.routeName);
                }),
                commonClickText("和", color: DoColors.white60, fontSize: 14),
                commonClickText("《隐私协议》",
                    color: DoColors.customColor, fontSize: 14, onTap: () {
                  Get.toNamed(CustomWebView.routeName);
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

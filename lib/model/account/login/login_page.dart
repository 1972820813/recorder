import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:project_recorder/model/account/forget/forget_page.dart';
import 'package:project_recorder/model/account/login/login_page_controller.dart';
import 'package:project_recorder/model/account/register/register_page.dart';
import 'package:project_recorder/model/webView/cumstom_web_view.dart';
import 'package:project_recorder/util/app_colors.dart';
import 'package:project_recorder/util/app_screenAdapter.dart';
import 'package:project_recorder/util/custom_widget.dart';

class LoginPage extends GetView<LoginPageController> {
  static const String routeName = "/login_page";

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Obx(() => Container(
          color: DoColors.black0,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  commonSizedBox(height: 30),
                  Container(
                    alignment: Alignment.topRight,
                    padding: const EdgeInsets.fromLTRB(0, 16, 12, 0),
                    child: commonClickText("暂不登录",
                        fontSize: 19.sp, color: DoColors.gray102, onTap: () {
                      //暂不登录，直接跳转到主页，清空前面所有页面
                      Get.back();
                    }),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(12, 30, 0, 0),
                    child: commonText("密码登录",
                        fontSize: 24, color: DoColors.white85),
                  ),
                  commonSizedBox(height: 50),
                  Container(
                      margin: const EdgeInsets.fromLTRB(12, 12, 12, 0),
                      height: 50,
                      child: TextFormField(
                        style:
                            TextStyle(fontSize: 19.sp, color: DoColors.white),
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
                          controller.loginEmail.value = value;
                        },
                      )),
                  Stack(
                    children: [
                      Container(
                          margin: EdgeInsets.fromLTRB(12.w, 12.w, 12.w, 0),
                          height: 50.w,
                          child: TextFormField(
                            style: TextStyle(
                                fontSize: 19.sp, color: DoColors.white),
                            autofocus: true,
                            cursorColor: DoColors.white85,
                            obscureText: controller.isShowPassword.value,
                            //设置内容是否可见
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
                              controller.loginPassword.value = value;
                            },
                          )),
                      Container(
                          alignment: Alignment.centerRight,
                          height: 50,
                          margin: const EdgeInsets.only(right: 24, top: 12),
                          child: commonClickImage(
                              controller.iconLoginPwdHint.value,
                              height: 20,
                              width: 20, onTap: () {
                            controller.isShowPassword.value =
                                !controller.isShowPassword.value;
                            controller.isShowPassword.value
                                ? controller.iconLoginPwdHint.value =
                                    "assets/images/res_icon_hint.png"
                                : controller.iconLoginPwdHint.value =
                                    "assets/images/res_icon_show.png";
                          }))
                    ],
                  ),
                  Container(
                      alignment: Alignment.centerRight,
                      height: 50,
                      padding: const EdgeInsets.only(right: 12),
                      child: commonClickText("忘记密码?",
                          fontSize: 18.sp, color: DoColors.white85, onTap: () {
                        Get.toNamed(ForgetPage.routeName);
                      })),
                  InkWell(
                    onTap: () {
                      controller.login();
                    },
                    child: Container(
                        margin:
                            EdgeInsets.only(right: 12.w, left: 12.w, top: 30.w),
                        height: 50,
                        alignment: Alignment.center,
                        width: DoScreenAdapter.screenW(),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: DoColors.customColor),
                        child: commonText("登录",
                            color: DoColors.white85, fontSize: 18)),
                  ),
                  commonSizedBox(height: 12),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      commonSizedBox(width: 12),
                      InkWell(
                        onTap: () {
                          controller.isAgreementChecked.value =
                              !controller.isAgreementChecked.value;
                        },
                        child: controller.isAgreementChecked.value
                            ? commonImage(
                                "assets/images/res_icon_agreement_checked.png",
                                height: 20,
                                width: 20)
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
                      commonClickText("同意",
                          color: DoColors.white60, fontSize: 14),
                      commonClickText("《服务协议》",
                          color: DoColors.customColor, fontSize: 14, onTap: () {
                        Get.toNamed(CustomWebView.routeName);
                      }),
                      commonClickText("和",
                          color: DoColors.white60, fontSize: 14),
                      commonClickText("《隐私协议》",
                          color: DoColors.customColor, fontSize: 14, onTap: () {
                        Get.toNamed(CustomWebView.routeName);
                      }),
                    ],
                  ),
                ],
              ),
              Container(
                alignment: Alignment.bottomCenter,
                margin: EdgeInsets.only(bottom: 30.w),
                child: commonClickText("注册账号",
                    fontSize: 19.sp,
                    color: DoColors.customColor,
                    decoration: TextDecoration.underline,
                    decorationColor: DoColors.customColor, onTap: () {
                  Get.toNamed(RegisterPage.routeName);
                }),
              )
            ],
          ),
        ));
  }
}

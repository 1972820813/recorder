import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_recorder/model/user/register/register_page.dart';
import 'package:project_recorder/util/app_colors.dart';

import 'login_page_controller.dart';

class LoginPage extends GetView<LoginPageController> {
  static const String routeName = "/login_page";

  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: DoColors.black0,
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              Container(
                alignment: Alignment.topRight,
                padding: const EdgeInsets.fromLTRB(0, 16, 12, 0),
                child: InkWell(
                  onTap: () {
                    //暂不登录，直接跳转到主页，清空前面所有页面
                  },
                  child: const Text(
                    "暂不登录",
                    style: TextStyle(fontSize: 19, color: DoColors.gray102),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(12, 30, 0, 0),
                child: const Text(
                  "密码登录",
                  style: TextStyle(fontSize: 24, color: DoColors.white85),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(16),
                height: 40,
                child: TextField(
                  decoration: InputDecoration(hintText: "请输入账号"),
                  onChanged: (value) {},
                  controller: controller.textEditingController,
                  style: const TextStyle(fontSize: 16, color: DoColors.white85),
                ),
              )
            ],
          ),
          Container(
            alignment: Alignment.bottomCenter,
            margin: const EdgeInsets.only(bottom: 30),
            child: InkWell(
              onTap: () {
                Get.toNamed(RegisterPage.routeName);
              },
              child: const Text(
                "注册账号",
                style: TextStyle(
                  fontSize: 19,
                  color: DoColors.customColor,
                  decoration: TextDecoration.underline,
                  decorationColor: DoColors.customColor,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

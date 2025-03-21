import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:project_recorder/model/account//login/login_page.dart';
import 'package:project_recorder/model/home/transsetting/trans_setting_page.dart';
import 'package:project_recorder/model/setting/ble/ble_page.dart';
import 'package:project_recorder/model/setting/wifi/wifi_page.dart';
import 'package:project_recorder/util/custom_widget.dart';

import '../../util/app_colors.dart';
import '../../util/app_screenAdapter.dart';
import 'setting_page_controller.dart';

class SettingPage extends GetView<SettingPageController> {
  static const routeName = "/setting_page";

  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => SettingPageController());
    // TODO: implement build
    return Obx(() => Container(
          color: DoColors.black0,
          child: ListView(
            children: [
              _loginStatus(),
              _remainingCloudSpace(),
              _vipView(),
              _intermediateLayoutView(
                  "历史对话",
                  "assets/images/res_img_setting_history.png",
                  "离线资源包",
                  "assets/images/res_img_setting_offline_resource.png",
                  "",
                  ""),
              commonSizedBox(height: 12),
              _intermediateLayoutView(
                  "WLAN",
                  "assets/images/res_img_setting_wifi.png",
                  "蓝牙",
                  "assets/images/res_img_setting_ble.png",
                  WifiPage.routeName,
                  BlePage.routeName),
              commonSizedBox(height: 12),
              _intermediateLayoutView(
                  "转写设置",
                  "assets/images/res_img_setting_tran.png",
                  "通用设置",
                  "assets/images/res_img_setting_general.png",
                  TransSettingPage.routeName,
                  ""),
              commonSizedBox(height: 12),
              _intermediateLayoutView(
                  "帮助与反馈",
                  "assets/images/res_img_setting_feedback.png",
                  "系统更新",
                  "assets/images/res_img_setting_update.png",
                  "",
                  ""),
              commonSizedBox(height: 12),
            ],
          ),
        ));
  }

  //登录状态
  Widget _loginStatus() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
      child: InkWell(
        onTap: () {
          // if (controller.userToken.value.isNotEmpty) {
          //   //个人信息页面
          //   Get.toNamed(UserInfoPage.routeName);
          // } else {
          //判断当前是否登录，如果登录，进入个人信息页面。未登录则进行登录页面
          Get.toNamed(LoginPage.routeName)!
              .then((value) => controller.profile());
          // }
          controller.position.value += 1;
        },
        child: Row(
          children: [
            controller.avatarAddress.value.isEmpty
                ? SvgPicture.asset(
                    'assets/svg/img_head.svg',
                    width: 50,
                    height: 50,
                  )
                : SvgPicture.asset(
                    'assets/svg/img_head.svg',
                    width: 50,
                    height: 50,
                  ),
            commonSizedBox(width: 6),
            commonText(controller.signInNow.value,
                fontSize: 19, color: DoColors.white85),
            commonImage("assets/images/res_img_back.png", width: 30, height: 30)
          ],
        ),
      ),
    );
  }

  //剩余云空间
  Widget _remainingCloudSpace() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(12, 6, 12, 6),
      child: Stack(
        children: [
          commonClickText("剩余云空间",
              fontSize: 19, color: DoColors.white85, onTap: () {}),
          Container(
            alignment: Alignment.topRight,
            child: commonText("--", fontSize: 19, color: DoColors.white85),
          )
        ],
      ),
    );
  }

  Widget _vipView() {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: SizedBox(
        width: DoScreenAdapter.screenW(),
        height: 60,
        child: Stack(
          alignment: AlignmentDirectional.centerStart,
          children: [
            Image.asset("assets/images/res_img_vip_bg.png",
                width: DoScreenAdapter.screenW(),
                height: 60,
                fit: BoxFit.fitWidth),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: commonImage("assets/images/res_img_setting_vip.png",
                  width: 26, height: 21),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 42),
                child: commonText(controller.vipTitle.value,
                    color: DoColors.vipTextColor, fontSize: 18)),
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 12),
              child: commonImage("assets/images/res_img_vip_back.png",
                  width: 26, height: 21),
            ),
          ],
        ),
      ),
    );
  }

  ///中间部分布局
  Widget _intermediateLayoutView(
    String title1,
    String iconPath1,
    String title2,
    String iconPath2,
    String routeName1,
    String routeName2,
  ) {
    return Container(
        color: DoColors.settingItemBg,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            settingItemView(title1, iconPath1, routeName1),
            Container(
              margin: const EdgeInsets.fromLTRB(12, 0, 12, 0),
              height: 1,
              width: DoScreenAdapter.screenW(),
              color: DoColors.dividerLineColor,
            ),
            settingItemView(title2, iconPath2, routeName2),
          ],
        ));
  }

  ///每个item的布局
  Widget settingItemView(String itemTitle, String logoPath, String routeName) {
    return SizedBox(
      width: DoScreenAdapter.screenW(),
      height: 50,
      child: InkWell(
        onTap: () {
          if (routeName.isNotEmpty) {
            Get.toNamed(routeName);
          }
        },
        child: Stack(
          alignment: AlignmentDirectional.centerStart,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: commonImage(logoPath, width: 26, height: 21),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 48),
              child:
                  commonText(itemTitle, color: DoColors.white85, fontSize: 18),
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 8),
              child: commonImage("assets/images/res_img_back.png",
                  width: 26, height: 21),
            ),
          ],
        ),
      ),
    );
  }
}

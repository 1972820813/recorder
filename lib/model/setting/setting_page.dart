import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _loginStatus(),
              _remainingCloudSpace(),
              _vipView(),
              settingListView()
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
          //判断当前是否登录，如果登录，进入个人信息页面。未登录则进行登录页面
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
            const SizedBox(
              width: 6,
            ),
            Text(
              controller.signInNow.value,
              style: const TextStyle(fontSize: 19, color: DoColors.white85),
            ),
            Image.asset(
              "assets/images/res_img_back.png",
              width: 30,
              height: 30,
            )
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
          const Text(
            "剩余云空间",
            style: TextStyle(fontSize: 19, color: DoColors.white85),
          ),
          Container(
            alignment: Alignment.topRight,
            child: const Text(
              "--",
              style: TextStyle(fontSize: 19, color: DoColors.white85),
            ),
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
            Image.asset(
              "assets/images/res_img_vip_bg.png",
              width: DoScreenAdapter.screenW(),
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Image.asset(
                "assets/images/res_img_setting_vip.png",
                width: 26,
                height: 21,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 42),
              child: Text(
                controller.vipTitle.value,
                style:
                    const TextStyle(color: DoColors.vipTextColor, fontSize: 18),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 12),
              child: Image.asset(
                "assets/images/res_img_vip_back.png",
                width: 26,
                height: 21,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget settingListView() {
    return settingItemView("历史对话", "assets/images/res_img_setting_history.png");
  }

  Widget settingItemView(String itemTitle, String logoPath) {
    return Container(
      width: DoScreenAdapter.screenW(),
      height: 40,
      color: DoColors.settingItemBg,
      child: InkWell(
        onTap: () {},
        child: Stack(
          alignment: AlignmentDirectional.centerStart,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Image.asset(
                logoPath,
                width: 26,
                height: 21,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 42),
              child: Text(
                itemTitle,
                style: const TextStyle(color: DoColors.white85, fontSize: 18),
              ),
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: const EdgeInsets.only(right: 8),
              child: Image.asset(
                "assets/images/res_img_back.png",
                width: 26,
                height: 21,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

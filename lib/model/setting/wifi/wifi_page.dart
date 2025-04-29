import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_recorder/model/setting/wifi/wifi_page_controller.dart';
import 'package:project_recorder/util/app_colors.dart';
import 'package:project_recorder/util/custom_widget.dart';

import '../../../util/app_screenAdapter.dart';

class WifiPage extends GetView<WifiPageController> {
  const WifiPage({super.key});

  static const String routeName = "/wifi_page";

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          customBar(controller.pageTitle.value),
          Container(
            color: DoColors.black0,
            height: DoScreenAdapter.screenH() - 45,
            child: ListView.builder(
                controller: controller.scrollController,
                itemCount: controller.wifiList.length,
                itemBuilder: (context, position) {
                  return InkWell(
                      onTap: () {
                        // Get.snackbar(controller.wifiList[position].ssid,
                        //     controller.wifiList[position].bssid,
                        //     backgroundColor: DoColors.white85);
                        print(
                            "点击了  $position   ssid:${controller.wifiList[position].ssid}     bssid:${controller.wifiList[position].bssid}");
                      },
                      child: Container(
                        margin: const EdgeInsets.fromLTRB(10, 6, 10, 6),
                        padding: const EdgeInsets.all(10),
                        decoration: ShapeDecoration(
                          color: DoColors.black28,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadiusDirectional.circular(5)),
                        ),
                        child: commonText(controller.wifiList[position].ssid,
                            color: DoColors.white85),
                      ));
                }),
          )
        ],
      ),
    );
  }
}

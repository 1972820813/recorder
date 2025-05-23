import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_recorder/model/home/language/language_page.dart';
import 'package:project_recorder/model/home/schema/schema_details_page.dart';
import 'package:project_recorder/model/home/transsetting/trans_setting_page.dart';
import 'package:project_recorder/util/app_colors.dart';
import 'package:project_recorder/util/constant_util.dart';
import 'package:project_recorder/util/custom_widget.dart';
import 'home_child_page_controller.dart';

class HomeChildPage extends GetView<HomeChildPageController> {
  const HomeChildPage(this.childTitle, this.childContent, this.childCurrent,
      {super.key});

  final String childTitle;
  final String childContent;
  final int childCurrent;

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => HomeChildPageController());
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 60, 10, 0),
          child: Container(
              decoration: ShapeDecoration(
                color: DoColors.black28,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.circular(5)),
              ),
              padding: const EdgeInsets.fromLTRB(12, 50, 12, 0),
              margin: const EdgeInsets.only(bottom: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      commonText(childTitle,
                          fontSize: 20, color: DoColors.white85),
                      commonSizedBox(width: 6),
                      commonClickImage("assets/images/res_img_warn.png",
                          width: 20, height: 20, onTap: () {
                        Get.toNamed(SchemaDetailsPage.routeName,
                            arguments: {"home_child_page_index": childCurrent});
                      }),
                      // 50宽度
                    ],
                  ),
                  commonText(childContent,
                      fontSize: 16, color: DoColors.gray102),
                ],
              )),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
          child:
              commonImage("assets/images/res_ip_0.png", width: 80, height: 80),
        ),
        Container(
          alignment: Alignment.topRight,
          margin: const EdgeInsets.fromLTRB(0, 75, 28, 0),
          child: commonClickImage(
              "assets/images/res_img_record_model_online.png",
              width: 30,
              height: 30, onTap: () {
            Get.toNamed(TransSettingPage.routeName);
          }),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          margin: const EdgeInsets.only(bottom: 70),
          child: commonClickImage("assets/images/res_img_voice.png",
              width: 60, height: 60, onTap: () {
            var mode = 0;
            switch (childCurrent) {
              case 0:
                mode = 0;
                break;
              case 1:
                mode = 0;
                break;
              case 2:
                mode = 0;
                break;
              case 3:
                mode = 0;
                break;
            }

            Get.toNamed(LanguagePage.routeName,
                arguments: {ConstantUtil.recordMode: mode});
          }),
        )
      ],
    );
  }
}

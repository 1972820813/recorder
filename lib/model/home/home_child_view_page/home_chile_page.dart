import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_recorder/model/home/language/language_page.dart';
import 'package:project_recorder/model/home/schema/schema_details_page.dart';
import 'package:project_recorder/model/home/transsetting/trans_setting_page.dart';
import 'package:project_recorder/util/app_colors.dart';
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
    return Container(
      child: Stack(
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
                        Text(
                          childTitle,
                          style: const TextStyle(
                              fontSize: 20, color: DoColors.white85),
                        ),
                        const SizedBox(width: 6), // 50宽度
                        InkWell(
                          child: Image.asset(
                            "assets/images/res_img_warn.png",
                            width: 20,
                            height: 20,
                          ),
                          onTap: () {
                            Get.toNamed(SchemaDetailsPage.routeName,
                                arguments: {
                                  "home_child_page_index": childCurrent,
                                });
                          },
                        )
                      ],
                    ),
                    Text(
                      childContent,
                      style: const TextStyle(
                          fontSize: 16, color: DoColors.gray102),
                    ),
                  ],
                )),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 0, 0),
            child: Image.asset(
              "assets/images/res_ip_0.png",
              width: 80,
              height: 80,
            ),
          ),
          Container(
            alignment: Alignment.topRight,
            margin: const EdgeInsets.fromLTRB(0, 75, 28, 0),
            child: InkWell(
              child: Image.asset(
                "assets/images/res_img_record_model_online.png",
                width: 30,
                height: 30,
              ),
              onTap: () {
                Get.toNamed(TransSettingPage.routeName);
              },
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            margin: const EdgeInsets.only(bottom: 70),
            child: InkWell(
              child: Image.asset(
                "assets/images/res_img_voice.png",
                width: 60,
                height: 60,
              ),
              onTap: () {
                Get.toNamed(LanguagePage.routeName);
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            alignment: Alignment.bottomCenter,
            child: const Text(
              "page_view 指示器",
              style: TextStyle(color: Colors.lightBlueAccent),
            ),
          )
        ],
      ),
    );
  }
}

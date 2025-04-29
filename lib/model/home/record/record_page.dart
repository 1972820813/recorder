import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_recorder/util/app_colors.dart';
import 'package:project_recorder/util/app_screenAdapter.dart';
import 'package:project_recorder/util/custom_widget.dart';

import 'record_page_controller.dart';

class RecordPage extends GetView<RecordPageController> {
  static const routeName = "/record_page";

  const RecordPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Obx(() => Container(
          color: DoColors.black0,
          child: Stack(
            children: [
              const SizedBox(
                height: 40,
              ),
              customTitleCenterBar(controller.languageName.value),
              Positioned(
                bottom: 0,
                child: Container(
                  decoration: const BoxDecoration(
                      color: DoColors.black28,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12))),
                  width: DoScreenAdapter.screenW(),
                  height: 100,
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            color: DoColors.gray40,
                            borderRadius: BorderRadius.all(Radius.circular(5))),
                        margin: const EdgeInsets.fromLTRB(12, 12, 12, 12),
                        height: 36,
                      ),
                      SizedBox(
                        width: DoScreenAdapter.screenW(),
                        height: 40,
                        child: Stack(
                          children: [
                            const Positioned(
                              left: 12,
                              child: Text(
                                "计时器",
                                style: TextStyle(
                                    color: DoColors.white85, fontSize: 14.0),
                              ),
                            ),
                            Positioned(
                              right: 12,
                              child: InkWell(
                                child: Image.asset(
                                  "assets/images/res_img_photo.png",
                                  width: 32,
                                  height: 32,
                                ),
                                onTap: () {
                                  controller.startRecording();
                                },
                              ),
                            ),
                            Positioned(
                              right: 56,
                              child: InkWell(
                                child: Image.asset(
                                  "assets/images/res_img_flag.png",
                                  width: 32,
                                  height: 32,
                                ),
                                onTap: () {
                                  controller.stopRecording();
                                },
                              ),
                            ),
                            Positioned(
                              right: 100,
                              child: InkWell(
                                child: Image.asset(
                                  "assets/images/res_img_recording.png",
                                  width: 32,
                                  height: 32,
                                ),
                                onTap: () {},
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

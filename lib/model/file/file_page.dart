import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_recorder/model/file/detail/record_details_page.dart';

import '../../util/app_colors.dart';
import 'file_page_controller.dart';

class FilePage extends GetView<FilePageController> {
  static const routeName = "/file_page";

  const FilePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => FilePageController());
    // TODO: implement build
    return Obx(() => Container(
          color: DoColors.black0,
          child: ListView.builder(
              controller: controller.scrollController,
              itemCount: controller.recordFileList.length,
              itemBuilder: (context, value) {
                //子控件布局
                return InkWell(
                  onTap: () {
                    Get.toNamed(RecordDetailsPage.routeName);
                  },
                  child: Container(
                    margin: const EdgeInsets.fromLTRB(10, 6, 10, 6),
                    padding: const EdgeInsets.all(10),
                    decoration: ShapeDecoration(
                      color: DoColors.black28,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.circular(5)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          controller.recordFileList[value].fileName,
                          style: const TextStyle(
                              fontSize: 19, color: DoColors.white85),
                        ),
                        const SizedBox(
                          height: 6,
                        ),
                        Row(
                          children: [
                            Image.asset(
                              "assets/images/res_icon_files_upload_success.png",
                              width: 18,
                              height: 18,
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Text(
                              "${controller.recordFileList[value].fileTime}",
                              style: const TextStyle(
                                  fontSize: 16, color: DoColors.gray153),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                );
              }),
        ));
  }
}

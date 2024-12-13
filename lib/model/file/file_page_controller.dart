import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_recorder/entity/record_file_entity.dart';

class FilePageController extends GetxController {
  final ScrollController scrollController = ScrollController();
  RecordFileEntity fileEntity = RecordFileEntity();
  RxList<RecordFileEntity> recordFileList = <RecordFileEntity>[].obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    setRecordFileMessage();
  }

  ///模拟数据
  setRecordFileMessage() {
    for (int i = 0; i < 20; i++) {
      RecordFileEntity recordFileEntity = RecordFileEntity();
      recordFileEntity.fileName = "2024_12_09_${i + 1}";
      recordFileEntity.fileTime = 1733731371;
      recordFileList.add(recordFileEntity);
    }
  }
}

import 'package:get/get.dart';

class SchemaDetailsPageController extends GetxController {
  Rx<String> pageTitle = "通用模式".obs;
  Rx<String> modeIntroduction = "一、模式简介".obs;
  Rx<String> micIntroduction = "二、麦克风工作".obs;
  Rx<String> placementIntroduction = "三、摆放建议".obs;
  Rx<String> modeContent1 = "".obs;
  Rx<String> modeContent2 = "".obs;
  Rx<String> modeContent3 = "".obs;

  int currentPageIndex =
      Get.arguments != null ? Get.arguments["home_child_page_index"] : 0;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    updatePageInfo();
  }

  void updatePageInfo() {
    switch (currentPageIndex) {
      case 0:
        pageTitle.value = "通用模式";
        modeContent1.value = "通用模式适用于绝大多数录音场景，如课堂、发布会等。";
        modeContent2.value = "定向麦克和阵列麦克同时收音，通过算法进行智能降噪优化，录音效果相对均衡。";
        modeContent3.value = "建议将定向麦克对准声源。";
        break;
      case 1:
        pageTitle.value = "会议模式";
        modeContent1.value =
            "会议模式适用于多人会议、论坛、研讨会等多人多方向发言的场景,例如:公司10人内小型会议、3~5人的商务交流等。";
        modeContent2.value = "阵列麦克收音，通过算法进行智能降噪优化，达到人声更清晰，优美的效果;同时提高语音转文字的准确率。";
        modeContent3.value = "会议模式中建议将录音笔摆放于会议区域中央区域，正面朝上，均匀收音。";
        break;
      case 2:
        pageTitle.value = "采访模式";
        modeContent1.value = "采访模式适用于一对一或者三人以内的采访场景。如面对面访谈、公司内面试及街头访问。";
        modeContent2.value =
            "定向麦克加阵列麦克收音，通过算法进行智能降噪优化，达到人声更清晰，优美的效果，降低环境噪音，同时提高语音转文字的准确率。";
        modeContent3.value = "采访模式中建议将录音笔定向麦克对准采访对象，距离以1米内为优。";
        break;
      case 3:
        pageTitle.value = "演讲模式";
        modeContent1.value =
            "演讲模式适用于会场较大的大型课堂、发布会或大型讲座等场景，人数一般较多。如大学阶梯教室上课、大型发布会及大型知识讲座等。";
        modeContent2.value =
            "定向麦克加阵列麦克收音，通过算法进行智能降噪优化，达到人声更清晰，降低环境噪音，同时提高语音转文字的准确率。";
        modeContent3.value = "演讲模式中建议将录音笔定向麦克对准演讲人员,距离以10米内为优。";
        break;
    }
  }
}

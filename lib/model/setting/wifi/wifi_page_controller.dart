import 'package:get/get.dart';

class WifiPageController extends GetxController{
  Rx<String> pageTitle = "Wifi列表".obs;
  // RxList<WifiNetwork> wifiListInfo = <WifiNetwork>[].obs;


  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    pageTitle.value = "Wifi列表";
  }



}
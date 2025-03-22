import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wifi_scan/wifi_scan.dart';

class WifiPageController extends GetxController {
  Rx<String> pageTitle = "Wifi列表".obs;
  RxList<WiFiAccessPoint> wifiList = <WiFiAccessPoint>[].obs;
  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    pageTitle.value = "Wifi列表";
    scanNetworks();
  }

  // 扫描 Wi-Fi
  void scanNetworks() async {
    final canScan = await WiFiScan.instance.canStartScan();
    if (canScan == CanStartScan.yes) {
      final networks = await WiFiScan.instance.getScannedResults();
      for (int i = 0; i < networks.length; i++) {
        print("Found networks: ${networks[i].ssid}");
        if(networks[i].ssid.isNotEmpty){
          wifiList.add(networks[i]);
        }
      }
    }
  }

// 连接 Wi-Fi（Android）
// void connectToWifi(String ssid, String password) async {
//   await WiFiForIoTPlugin.connect(
//     ssid: ssid,
//     password: password,
//     joinOnce: false,
//   );
// }
}

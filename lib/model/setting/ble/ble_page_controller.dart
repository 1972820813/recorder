import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';

class BlePageController extends GetxController {
  RxString pageTitle = "蓝牙".obs;

  ///当前已经连接的蓝牙设备
  List<BluetoothDevice> _systemDevices = [];

  ///扫描到的蓝牙设备
  List<ScanResult> _scanResults = [];
  late StreamSubscription<List<ScanResult>> _scanResultsSubscription;
  late StreamSubscription<bool> _isScanningSubscription;

  List<Widget> _buildSystemDeviceTiles() {
    return _systemDevices.map((device) {
      return ListTile(
        title: Text(device.platformName),
        subtitle: Text(device.remoteId.toString()),
        trailing: ElevatedButton(
          onPressed: () {
            // Get.to(DeviceScreen(device: device));
          },
          child: const Text('CONNECT'),
        ),
      );
    }).toList();
  }

  List<Widget> _buildScanResultTiles() {
    return _scanResults
        .map(
          (scanResult) => ListTile(
            title: Text(
              scanResult.device.platformName,
              overflow: TextOverflow.ellipsis,
            ),
            subtitle: Text(
              scanResult.device.remoteId.toString(),
            ),
            trailing: ElevatedButton(
              onPressed: () {
                // Get.to(DeviceScreen(device: scanResult.device));
              },
              child: const Text('CONNECT'),
            ),
          ),
        )
        .toList();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _scanResultsSubscription = FlutterBluePlus.scanResults.listen((results) {
      _scanResults = results;
      // if (mounted) {
      //   setState(() {});
      // }
    }, onError: (error) {
      print('Scan Error:$error');
    });
    _isScanningSubscription = FlutterBluePlus.isScanning.listen((state) {
      // if (mounted) {
      //   setState(() {});
      // }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scanResultsSubscription.cancel();
    _isScanningSubscription.cancel();
  }
}

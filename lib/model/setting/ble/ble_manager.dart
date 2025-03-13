import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:get/get.dart';
import 'package:project_recorder/util/ble_callback.dart';
import 'package:project_recorder/util/ble_config.dart';

class BleManager {
  static BleManager? _instance;

  BluetoothDevice? _device;
  BluetoothCharacteristic? _writeCharacteristic;
  BluetoothCharacteristic? _notifyCharacteristic;

  // 回调接口
  BleCallback? _callback;

  // 设置回调
  void setCallback(BleCallback callback) {
    _callback = callback;
  }

  // 私有构造函数
  BleManager._();

  // 单例模式
  static BleManager getInstance() {
    _instance ??= BleManager._();
    return _instance!;
  }

  // 检查蓝牙是否可用
  Future<bool> isAvailable() async {
    return await FlutterBluePlus.isAvailable;
  }

  // 检查蓝牙是否开启
  Future<bool> isOn() async {
    return await FlutterBluePlus.isOn;
  }

  // 开始扫描
  Future<void> startScan({
    Duration? timeout,
    List<Guid>? withServices,
  }) async {
    if (!(await isOn())) {
      Get.snackbar("蓝牙未开启", "请打开蓝牙");
    }

    // 停止之前的扫描
    await stopScan();

    // 监听扫描结果
    FlutterBluePlus.scanResults.listen((results) {
      for (ScanResult result in results) {
        // print("扫描结果: ${result.device.name} - ${result.device.remoteId}");
        if (_callback != null) {
          _callback!.onScanResult(result.device);
        }
      }
    });

    // 开始扫描
    print("开始扫描");
    await FlutterBluePlus.startScan(
      timeout: timeout ?? const Duration(seconds: 4),
      withServices: withServices ?? [],
    );
  }

  // 停止扫描
  Future<void> stopScan() async {
    await FlutterBluePlus.stopScan();
  }

  BluetoothDevice? getDeviceFromAddress(String address) {
    try {
      BluetoothDevice device = BluetoothDevice.fromId(address);
      return device;
    } catch (e) {
      print('获取设备失败: $e');
      return null;
    }
  }

  // 连接设备
  Future<bool> connect(BluetoothDevice device) async {
    try {
      await device.connect(
        timeout: const Duration(seconds: 4),
        autoConnect: false,
      );

      _device = device;

      // 添加断开连接监听
      device.connectionState.listen((BluetoothConnectionState state) {
        if (state == BluetoothConnectionState.disconnected) {
          // 设备断开连接
          if (_callback != null) {
            _callback!.onDisconnected();
          }
          _device = null;
          _writeCharacteristic = null;
          _notifyCharacteristic = null;
        }
      });

      // 发现服务
      List<BluetoothService> services = await device.discoverServices();
      for (BluetoothService service in services) {
        if (service.uuid.toString() == BleConfig.SERVICE_UUID) {
          for (BluetoothCharacteristic characteristic in service
              .characteristics) {
            if (characteristic.uuid.toString() ==
                BleConfig.WRITE_CHARACTERISTIC_UUID) {
              _writeCharacteristic = characteristic;
            }

            if (characteristic.uuid.toString() ==
                BleConfig.NOTIFY_CHARACTERISTIC_UUID) {
              _notifyCharacteristic = characteristic;
            }
          }
        }
      }

      if (_notifyCharacteristic != null) {
        // 设置通知
        await enableNotification();
        if (_callback != null) {
          _callback!.onConnectSuccess();
        }
        return true;
      } else {
        print("未找到指定特征值");
        return false;
      }
    } catch (e) {
      if (_callback != null) {
        _callback!.onConnectFailed(e.toString());
      }
      disconnect();
      return false;
    }
  }

  // 断开连接
  Future<void> disconnect() async {
    if (_device != null) {
      await _device!.disconnect();
      _device = null;
      _notifyCharacteristic = null;
      _writeCharacteristic = null;
    }
  }

  // 发送数据
  Future<bool> sendData(List<int> data) async {
    if (_writeCharacteristic != null) {
      await _writeCharacteristic!.write(data);
      return true;
    } else {
      print("未持有WRITE_UUID");
      return false;
    }
  }

  // 启用通知
  Future<void> enableNotification() async {
    if (_notifyCharacteristic != null) {
      await _notifyCharacteristic!.setNotifyValue(true);
      _notifyCharacteristic!.value.listen((value) {
        if (_callback != null) {
          _callback!.onDataReceived(value);
        }
      });
    } else {
      print("未持有NOTIFY_UUID");
    }
  }

  // 获取连接状态
  bool isConnected() {
    return _device != null && _notifyCharacteristic != null;
  }
}

import 'package:permission_handler/permission_handler.dart';

class PermissionUtil {
  /// 请求蓝牙和位置信息权限
  static Future<bool> requestBluetoothConnectPermission() async {
    Map<Permission, PermissionStatus> permission = await [
      Permission.bluetoothConnect,
      Permission.bluetoothScan,
      Permission.bluetoothAdvertise,
      Permission.location,
    ].request();

    if (await Permission.bluetoothConnect.isGranted) {
      print("蓝牙连接权限申请通过");
    } else {
      print("蓝牙连接权限申请失败");
      return false;
    }

    if (await Permission.bluetoothScan.isGranted) {
      print("蓝牙扫描权限申请通过");
    } else {
      print("蓝牙扫描权限申请失败");
      return false;
    }

    if (await Permission.bluetoothAdvertise.isGranted) {
      print("蓝牙广播权限申请通过");
    } else {
      print("蓝牙广播权限申请失败");
      return false;
    }

    if (await Permission.location.isGranted) {
      print("位置权限申请通过");
    } else {
      print("位置权限申请失败");
      return false;
    }

    return true;
  }
}
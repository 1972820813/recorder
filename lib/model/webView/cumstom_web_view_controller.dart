import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../util/app_colors.dart';

class CustomWebViewController extends GetxController {
  // Rx<String> url = Get.arguments["url"];

  String url = "https://www.baidu.com/";
  // String url = Get.arguments['url'];

  late WebViewController webViewController;

  loadUrl() {
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(DoColors.black0)
      ..setNavigationDelegate(
          NavigationDelegate(onPageFinished: (url) {}, onProgress: (value) {}))
      ..loadRequest(Uri.parse(url));
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadUrl();
  }
}

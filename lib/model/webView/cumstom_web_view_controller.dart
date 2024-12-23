import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../util/app_colors.dart';

class CustomWebViewController extends GetxController {
  String url = "https://www.baidu.com/";

  // String url = Get.arguments['url'];

  late WebViewController webViewController;

  loadUrl() {
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(DoColors.black0)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (url) {},
          onProgress: (value) {},
          onNavigationRequest: (request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(url));
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    loadUrl();
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_recorder/model/webView/cumstom_web_view_controller.dart';
import 'package:project_recorder/util/app_colors.dart';
import 'package:project_recorder/util/app_screenAdapter.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CustomWebView extends GetView<CustomWebViewController> {
  const CustomWebView({super.key});

  static const String routeName = "/custom_web_view";

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => CustomWebViewController());
    // TODO: implement build
    return Container(
      color: DoColors.black0,
      width: DoScreenAdapter.screenW(),
      height: 300,
      child: WebViewWidget(
        controller: controller.webViewController,
      ),
    );
  }
}

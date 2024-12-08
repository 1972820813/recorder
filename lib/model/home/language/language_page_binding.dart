import 'package:get/get.dart';
import 'language_page_controller.dart';

class LanguagePageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => LanguagePageController());
  }
}
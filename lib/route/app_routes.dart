import 'package:get/get.dart';
import 'package:project_recorder/model/home/record/record_page.dart';
import 'package:project_recorder/model/home/record/record_page_binding.dart';
import 'package:project_recorder/model/main/main_page.dart';
import 'package:project_recorder/model/main/main_page_binding.dart';

import '../model/file/file_page.dart';
import '../model/home/home_page.dart';
import '../model/home/language/language_page.dart';
import '../model/home/language/language_page_binding.dart';
import '../model/home/schema/schema_details_page.dart';
import '../model/home/transsetting/trans_setting_page.dart';
import '../model/home/transsetting/trans_setting_page_binding.dart';
import '../model/setting/setting_page.dart';
import '../model/tool/tool_page.dart';

var routes = [
  GetPage(
      name: MainPage.routeName,
      page: () => const MainPage(),
      binding: MainPageBinding()),
  GetPage(
    name: HomePage.routeName,
    page: () => const HomePage(),
  ),
  GetPage(
    name: FilePage.routeName,
    page: () => const FilePage(),
  ),
  GetPage(
    name: SettingPage.routeName,
    page: () => const SettingPage(),
  ),
  GetPage(
    name: ToolPage.routeName,
    page: () => const ToolPage(),
  ),
  GetPage(
      name: RecordPage.routeName,
      page: () => const RecordPage(),
      binding: RecordPageBinding()),
  GetPage(
      name: LanguagePage.routeName,
      page: () => const LanguagePage(),
      binding: LanguagePageBinding()),
  GetPage(
      name: TransSettingPage.routeName,
      page: () => const TransSettingPage(),
      binding: TransSettingPageBinding()),
  GetPage(
    name: SchemaDetailsPage.routeName,
    page: () => const SchemaDetailsPage(),
  ),
];

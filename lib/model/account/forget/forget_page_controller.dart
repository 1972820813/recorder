import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPageController extends GetxController{
  TextEditingController emailController = TextEditingController();
  TextEditingController pwdController = TextEditingController();

  OutlineInputBorder customBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(5),
      borderSide: const BorderSide(style: BorderStyle.none));
  Rx<bool> isShowPassword = true.obs;
  Rx<String> loginEmail = "".obs;

}
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetpasswordpageController extends GetxController {
  final emailController = TextEditingController();

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}

import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LoginpageController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  var isLoading = false.obs;
  var hidePassword = true.obs;

  // Email Regex
  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  void login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    // Validation
    if (email.isEmpty || password.isEmpty) {
      Get.snackbar(
        "Error",
        "Please fill all fields",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    if (!emailRegex.hasMatch(email)) {
      Get.snackbar(
        "Error",
        "Please enter a valid email",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    if (password.length < 6) {
      Get.snackbar(
        "Error",
        "Password must be at least 6 characters",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    // If validation passed
    isLoading.value = true;

    // Simulate login API call
    await Future.delayed(const Duration(seconds: 2));

    isLoading.value = false;

    // Navigate to Home Screen
    Get.offNamed('/home'); // make sure you have a route named '/home'
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}

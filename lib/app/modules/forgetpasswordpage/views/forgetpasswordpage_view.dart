import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../loginpage/controllers/loginpage_controller.dart';
import '../../loginpage/views/loginpage_view.dart';
import '../controllers/forgetpasswordpage_controller.dart';

class ForgetpasswordpageView extends GetView<ForgetpasswordpageController> {
  const ForgetpasswordpageView({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Navigate back to login screen
            Get.put(LoginpageController());

            Get.offAll(() => const LoginpageView());
          },
        ),
        title: const Text('Forgot Password'),
        centerTitle: true,
        backgroundColor: Colors.white,

      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 40),
            Text(
              "Enter your email to reset your password",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: "Email",
                prefixIcon: const Icon(Icons.email_outlined),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Call API or show snackbar
                if (emailController.text.trim().isEmpty) {
                  Get.snackbar(
                    "Error",
                    "Please enter your email",
                    backgroundColor: Colors.red,
                    colorText: Colors.white,
                  );
                } else {
                  // Handle forgot password logic
                  Get.snackbar(
                    "Success",
                    "Password reset link sent to ${emailController.text.trim()}",
                    backgroundColor: Colors.green,
                    colorText: Colors.white,
                  );
                }
              },
              child: const Text(
                "Send Reset Link",
                style: TextStyle(color: Colors.white), // <-- Set text color to white
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
            )
          ],
        ),
      ),
    );
  }
}

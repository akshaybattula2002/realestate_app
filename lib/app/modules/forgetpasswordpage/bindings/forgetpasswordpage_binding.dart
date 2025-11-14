import 'package:get/get.dart';

import '../controllers/forgetpasswordpage_controller.dart';

class ForgetpasswordpageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgetpasswordpageController>(
      () => ForgetpasswordpageController(),
    );
  }
}

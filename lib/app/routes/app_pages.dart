import 'package:get/get.dart';

import '../modules/forgetpasswordpage/bindings/forgetpasswordpage_binding.dart';
import '../modules/forgetpasswordpage/views/forgetpasswordpage_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/loginpage/bindings/loginpage_binding.dart';
import '../modules/loginpage/views/loginpage_view.dart';
import '../modules/signup/bindings/signup_binding.dart';
import '../modules/signup/views/signup_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.LOGINPAGE;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.LOGINPAGE,
      page: () => const LoginpageView(),
      binding: LoginpageBinding(),
    ),
    GetPage(
      name: _Paths.FORGETPASSWORDPAGE,
      page: () => const ForgetpasswordpageView(),
      binding: ForgetpasswordpageBinding(),
    ),
    GetPage(
      name: _Paths.SIGNUP,
      page: () => const SignupView(),
      binding: SignupBinding(),
    ),
  ];
}

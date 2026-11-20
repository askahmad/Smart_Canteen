import 'package:get/get.dart';
import 'app_routes.dart';
import '../controllers/splash_controller.dart';
import '../controllers/auth_controller.dart';
import '../controllers/home_controller.dart';
import '../views/splssh_view.dart';
import '../views/sign_in_view.dart';
import '../views/sign_up_view.dart';
import '../views/home_view.dart';

class AppPages {
  static const initial = AppRoutes.splash;

  static final routes = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplsshView(),
      binding: BindingsBuilder(() {
        Get.put(SplashController());
      }),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 600),
    ),
    GetPage(
      name: AppRoutes.signIn,
      page: () => const SignInView(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => AuthController());
      }),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: AppRoutes.signUp,
      page: () => const SignUpView(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => AuthController());
      }),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeView(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => HomeController());
      }),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),
  ];
}

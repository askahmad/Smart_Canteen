import 'package:get/get.dart';
import 'app_routes.dart';
import '../controllers/splash_controller.dart';
import '../controllers/auth_controller.dart';
import '../controllers/home_controller.dart';
import '../controllers/categories_controller.dart';
import '../controllers/cart_controller.dart';
import '../controllers/checkout_controller.dart';
import '../controllers/profile_controller.dart';
import '../views/splssh_view.dart';
import '../views/sign_in_view.dart';
import '../views/sign_up_view.dart';
import '../views/home_view.dart';
import '../views/categories_view.dart';
import '../views/category_detail_view.dart';
import '../views/cart_view.dart';
import '../views/order_summary_view.dart';
import '../views/address_list_view.dart';
import '../views/add_new_address_view.dart';
import '../views/add_delivery_address_view.dart';
import '../views/payment_methods_view.dart';
import '../views/add_card_view.dart';
import '../views/payment_success_view.dart';
import '../views/order_tracking_view.dart';
import '../views/profile_view.dart';
import '../views/settings_view.dart';
import '../views/edit_profile_view.dart';
import '../views/password_manager_view.dart';

class AppPages {
  static const initial = AppRoutes.splash;

  static final routes = [
    // 1. Splash Screen (Splssh.png)
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplsshView(),
      binding: BindingsBuilder(() {
        Get.put(SplashController());
      }),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 600),
    ),

    // 2. Sign In Screen (sign in.png)
    GetPage(
      name: AppRoutes.signIn,
      page: () => const SignInView(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => AuthController());
      }),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),

    // 3. Sign Up Screen (sign Up.png)
    GetPage(
      name: AppRoutes.signUp,
      page: () => const SignUpView(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => AuthController());
      }),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),

    // 4. Home Screen (Home.png)
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeView(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => HomeController());
        Get.lazyPut(() => CartController());
      }),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),

    // 5. Categories Screen (Categories.png)
    GetPage(
      name: AppRoutes.categories,
      page: () => const CategoriesView(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => CategoriesController());
      }),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),

    // 6. Category Detail / Pizza Screen (Categories/Pizza.png)
    GetPage(
      name: AppRoutes.categoryDetail,
      page: () => const CategoryDetailView(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => CategoryDetailController());
        Get.lazyPut(() => CartController());
      }),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),

    // 7. Cart Screen (Cart.png)
    GetPage(
      name: AppRoutes.cart,
      page: () => const CartView(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => CartController());
      }),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),

    // 8. Order Summary Screen (Cart-1.png)
    GetPage(
      name: AppRoutes.orderSummary,
      page: () => const OrderSummaryView(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => CartController());
      }),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),

    // 9. Address List Screen (Address.png)
    GetPage(
      name: AppRoutes.addressList,
      page: () => const AddressListView(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => CheckoutController());
      }),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),

    // 10. Add New Address Screen (Address-1.png)
    GetPage(
      name: AppRoutes.addNewAddress,
      page: () => const AddNewAddressView(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => CheckoutController());
      }),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),

    // 11. Add Delivery Address Screen (Add Delivery Address.png)
    GetPage(
      name: AppRoutes.addDeliveryAddress,
      page: () => const AddDeliveryAddressView(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => CheckoutController());
      }),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),

    // 12. Payment Methods Screen (Payment methods.png, Payment methods-1.png)
    GetPage(
      name: AppRoutes.paymentMethods,
      page: () => const PaymentMethodsView(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => CheckoutController());
      }),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),

    // 13. Add Card Screen (Add Card.png)
    GetPage(
      name: AppRoutes.addCard,
      page: () => const AddCardView(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => CheckoutController());
      }),
      transition: Transition.downToUp,
      transitionDuration: const Duration(milliseconds: 300),
    ),

    // 14. Payment Successful Screen (Payment Successfull.png)
    GetPage(
      name: AppRoutes.paymentSuccess,
      page: () => const PaymentSuccessView(),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 400),
    ),

    // 15. Order Tracking Screen (Tracking Order_01.png, Tracking Order_02.png)
    GetPage(
      name: AppRoutes.orderTracking,
      page: () => const OrderTrackingView(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => CheckoutController());
      }),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),

    // 16. User Profile Screen (User profile.jpg, User profile-1.jpg)
    GetPage(
      name: AppRoutes.profile,
      page: () => const ProfileView(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => ProfileController());
      }),
      transition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 300),
    ),

    // 17. Settings Screen (profile (1\3).jpg)
    GetPage(
      name: AppRoutes.settings,
      page: () => const SettingsView(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),

    // 18. Edit Profile Screen (Edit Profile.png)
    GetPage(
      name: AppRoutes.editProfile,
      page: () => const EditProfileView(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => ProfileController());
      }),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),

    // 19. Password Manager Screen (Password Manager.png)
    GetPage(
      name: AppRoutes.passwordManager,
      page: () => const PasswordManagerView(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => ProfileController());
      }),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
  ];
}

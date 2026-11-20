import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/app_colors.dart';
import '../constants/app_assets.dart';
import '../controllers/auth_controller.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';
import '../routes/app_routes.dart';

class SignInView extends GetView<AuthController> {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 24),

                      // Screen Title
                      const Center(
                        child: Text(
                          'Sign In',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textDark,
                          ),
                        ),
                      ),

                      const SizedBox(height: 32),

                      // Canteen Illustration
                      Center(
                        child: SizedBox(
                          width: 140,
                          height: 140,
                          child: Image.asset(
                            AppAssets.canteenSplash,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),

                      const SizedBox(height: 38),

                      // Phone Number Field
                      CustomTextField(
                        label: 'Phone Number',
                        hintText: '+923000 0000000',
                        controller: controller.phoneController,
                        keyboardType: TextInputType.phone,
                      ),

                      const SizedBox(height: 18),

                      // Password Field (Reactive)
                      Obx(
                        () => CustomTextField(
                          label: 'Password',
                          hintText: '****************',
                          controller: controller.passwordController,
                          obscureText: controller.isPasswordHidden.value,
                          suffixIcon: IconButton(
                            icon: Icon(
                              controller.isPasswordHidden.value
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: AppColors.textGrey,
                              size: 20,
                            ),
                            onPressed: controller.togglePasswordVisibility,
                          ),
                        ),
                      ),

                      const SizedBox(height: 10),

                      // Forgot Password Link
                      Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () {
                            Get.snackbar(
                              'Password Reset',
                              'Password reset instructions sent to your registered contact.',
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: AppColors.primaryTeal,
                              colorText: Colors.white,
                            );
                          },
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: AppColors.primaryTeal,
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.primaryTeal,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 28),

                      // Sign In Button (Reactive)
                      Obx(
                        () => CustomButton(
                          text: 'Sign In',
                          isLoading: controller.isLoading.value,
                          onPressed: controller.signIn,
                        ),
                      ),

                      const Spacer(),

                      // Don't have an account? Sign up
                      Padding(
                        padding: const EdgeInsets.only(bottom: 24, top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              'Don’t have an account? ',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 13.5,
                                color: AppColors.textDark,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(AppRoutes.signUp);
                              },
                              child: const Text(
                                'Sign up',
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 13.5,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.primaryTeal,
                                  decoration: TextDecoration.underline,
                                  decorationColor: AppColors.primaryTeal,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

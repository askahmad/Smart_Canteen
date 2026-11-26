import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/app_colors.dart';
import '../controllers/profile_controller.dart';
import '../widgets/custom_back_button.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class PasswordManagerView extends GetView<ProfileController> {
  const PasswordManagerView({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<ProfileController>()) {
      Get.put(ProfileController());
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 12),

                    // Header
                    Row(
                      children: [
                        const CustomBackButton(),
                        const Expanded(
                          child: Center(
                            child: Text(
                              'New Password',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 22,
                                fontWeight: FontWeight.w600,
                                color: AppColors.textDark,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 42),
                      ],
                    ),

                    const SizedBox(height: 32),

                    // Current Password Field
                    Obx(
                      () => CustomTextField(
                        label: 'Current Password',
                        hintText: '****************',
                        controller: controller.currentPasswordController,
                        obscureText: controller.isCurrentPasswordHidden.value,
                        suffixIcon: IconButton(
                          icon: Icon(
                            controller.isCurrentPasswordHidden.value
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: AppColors.textGrey,
                            size: 20,
                          ),
                          onPressed: () {
                            controller.isCurrentPasswordHidden.value =
                                !controller.isCurrentPasswordHidden.value;
                          },
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),

                    // Forgot Password Link
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          Get.snackbar(
                            'Password Reset',
                            'Reset verification email has been sent to your registered email.',
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

                    const SizedBox(height: 20),

                    // New Password Field
                    Obx(
                      () => CustomTextField(
                        label: 'New Password',
                        hintText: '****************',
                        controller: controller.newPasswordController,
                        obscureText: controller.isNewPasswordHidden.value,
                        suffixIcon: IconButton(
                          icon: Icon(
                            controller.isNewPasswordHidden.value
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: AppColors.textGrey,
                            size: 20,
                          ),
                          onPressed: () {
                            controller.isNewPasswordHidden.value =
                                !controller.isNewPasswordHidden.value;
                          },
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Confirm New Password Field
                    Obx(
                      () => CustomTextField(
                        label: 'Confirm New Password',
                        hintText: '****************',
                        controller: controller.confirmPasswordController,
                        obscureText: controller.isConfirmPasswordHidden.value,
                        suffixIcon: IconButton(
                          icon: Icon(
                            controller.isConfirmPasswordHidden.value
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: AppColors.textGrey,
                            size: 20,
                          ),
                          onPressed: () {
                            controller.isConfirmPasswordHidden.value =
                                !controller.isConfirmPasswordHidden.value;
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Bottom Sticky Update Password Button
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
              decoration: BoxDecoration(
                color: const Color(0xFFF8F9FA),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(28),
                  topRight: Radius.circular(28),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 14,
                    offset: const Offset(0, -3),
                  ),
                ],
              ),
              child: CustomButton(
                text: 'Update Password',
                height: 52,
                borderRadius: 14,
                onPressed: () {
                  final cur = controller.currentPasswordController.text;
                  final np = controller.newPasswordController.text;
                  final cp = controller.confirmPasswordController.text;

                  if (cur.isEmpty || np.isEmpty || cp.isEmpty) {
                    Get.snackbar(
                      'Required',
                      'Please fill in all password fields.',
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.redAccent,
                      colorText: Colors.white,
                    );
                    return;
                  }

                  if (np != cp) {
                    Get.snackbar(
                      'Mismatch',
                      'New passwords do not match.',
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.redAccent,
                      colorText: Colors.white,
                    );
                    return;
                  }

                  controller.currentPasswordController.clear();
                  controller.newPasswordController.clear();
                  controller.confirmPasswordController.clear();
                  Get.back();
                  Get.snackbar(
                    'Success',
                    'Your password has been updated securely.',
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: AppColors.primaryTeal,
                    colorText: Colors.white,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/app_colors.dart';
import '../controllers/auth_controller.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/custom_button.dart';

class SignUpView extends GetView<AuthController> {
  const SignUpView({super.key});

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
                          'Sign Up',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                            color: AppColors.textDark,
                          ),
                        ),
                      ),

                      const SizedBox(height: 28),

                      // Full Name
                      CustomTextField(
                        label: 'Full Name',
                        hintText: 'Steve Harvey',
                        controller: controller.fullNameController,
                      ),

                      const SizedBox(height: 16),

                      // Phone Number
                      CustomTextField(
                        label: 'Phone Number',
                        hintText: '+923000 0000000',
                        controller: controller.signUpPhoneController,
                        keyboardType: TextInputType.phone,
                      ),

                      const SizedBox(height: 16),

                      // Address
                      CustomTextField(
                        label: 'Address',
                        hintText: 'Address Line 1',
                        controller: controller.addressController,
                      ),

                      const SizedBox(height: 12),

                      // City & State Row
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              hintText: 'City',
                              controller: controller.cityController,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: CustomTextField(
                              hintText: 'State',
                              controller: controller.stateController,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 12),

                      // Zip Code & Country Row
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              hintText: 'Zip Code',
                              controller: controller.zipController,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: CustomTextField(
                              hintText: 'Country',
                              controller: controller.countryController,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      // Password (Reactive)
                      Obx(
                        () => CustomTextField(
                          label: 'Password',
                          hintText: '****************',
                          controller: controller.signUpPasswordController,
                          obscureText: controller.isSignUpPasswordHidden.value,
                          suffixIcon: IconButton(
                            icon: Icon(
                              controller.isSignUpPasswordHidden.value
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined,
                              color: AppColors.textGrey,
                              size: 20,
                            ),
                            onPressed: controller.toggleSignUpPasswordVisibility,
                          ),
                        ),
                      ),

                      const SizedBox(height: 28),

                      // Sign Up Button (Reactive)
                      Obx(
                        () => CustomButton(
                          text: 'Sign Up',
                          isLoading: controller.isLoading.value,
                          onPressed: controller.signUp,
                        ),
                      ),

                      const Spacer(),

                      // Don’t have an account? Sign In
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
                                Get.back();
                              },
                              child: const Text(
                                'Sign In',
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

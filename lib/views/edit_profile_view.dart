import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/app_assets.dart';
import '../constants/app_colors.dart';
import '../controllers/profile_controller.dart';
import '../widgets/custom_back_button.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class EditProfileView extends GetView<ProfileController> {
  const EditProfileView({super.key});

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
                  children: [
                    const SizedBox(height: 12),

                    // Header
                    Row(
                      children: [
                        const CustomBackButton(),
                        const Expanded(
                          child: Center(
                            child: Text(
                              'Edit Profile',
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

                    const SizedBox(height: 24),

                    // Avatar with Camera Badge
                    Center(
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppColors.primaryTeal,
                                width: 2.5,
                              ),
                            ),
                            child: ClipOval(
                              child: SizedBox(
                                width: 110,
                                height: 110,
                                child: Image.asset(
                                  AppAssets.profileAvatar,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 2,
                            right: 4,
                            child: Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                color: AppColors.primaryTeal,
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: Colors.white,
                                  width: 2,
                                ),
                              ),
                              child: const Icon(
                                Icons.camera_alt_rounded,
                                color: Colors.white,
                                size: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 28),

                    // Form Fields
                    CustomTextField(
                      label: 'Full Name',
                      hintText: 'Steve Harvey',
                      controller: controller.editNameController,
                    ),

                    const SizedBox(height: 16),

                    CustomTextField(
                      label: 'Email',
                      hintText: 'example@gmail.com',
                      controller: controller.editEmailController,
                      keyboardType: TextInputType.emailAddress,
                    ),

                    const SizedBox(height: 16),

                    CustomTextField(
                      label: 'Phone Number',
                      hintText: '+000 000 0000',
                      controller: controller.editPhoneController,
                      keyboardType: TextInputType.phone,
                    ),

                    const SizedBox(height: 16),

                    CustomTextField(
                      label: 'Address',
                      hintText: 'Address Line 1',
                      controller: controller.editAddressController,
                    ),

                    const SizedBox(height: 14),

                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            hintText: 'City',
                            controller: controller.editCityController,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: CustomTextField(
                            hintText: 'State',
                            controller: controller.editStateController,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 14),

                    Row(
                      children: [
                        Expanded(
                          child: CustomTextField(
                            hintText: 'Zip Code',
                            controller: controller.editZipController,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: CustomTextField(
                            hintText: 'Country',
                            controller: controller.editCountryController,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),

            // Bottom Sticky Update Button
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
                text: 'Update',
                height: 52,
                borderRadius: 14,
                onPressed: () {
                  controller.updateProfile();
                  Get.back();
                  Get.snackbar(
                    'Profile Updated',
                    'Your personal information has been updated.',
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

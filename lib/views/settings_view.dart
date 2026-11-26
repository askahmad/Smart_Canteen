import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/app_colors.dart';
import '../routes/app_routes.dart';
import '../widgets/custom_back_button.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
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
                        'Settings',
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

              const SizedBox(height: 36),

              // Settings Options List
              _buildSettingItem(
                icon: Icons.credit_card_outlined,
                title: 'Payment Method',
                onTap: () => Get.toNamed(AppRoutes.paymentMethods),
                showChevron: true,
              ),
              const Divider(height: 1, color: Color(0xFFEBEBEB)),

              _buildSettingItem(
                icon: Icons.lock_outline_rounded,
                title: 'Change Password',
                onTap: () => Get.toNamed(AppRoutes.passwordManager),
                showChevron: true,
              ),
              const Divider(height: 1, color: Color(0xFFEBEBEB)),

              _buildSettingItem(
                icon: Icons.location_on_outlined,
                title: 'Address',
                onTap: () => Get.toNamed(AppRoutes.addressList),
                showChevron: false,
              ),
              const Divider(height: 1, color: Color(0xFFEBEBEB)),

              _buildSettingItem(
                icon: Icons.delete_outline_rounded,
                title: 'Delete Account',
                onTap: () {
                  Get.defaultDialog(
                    title: 'Delete Account',
                    middleText: 'Are you sure you want to permanently delete your account?',
                    textConfirm: 'Delete',
                    textCancel: 'Cancel',
                    confirmTextColor: Colors.white,
                    buttonColor: AppColors.dangerRed,
                    onConfirm: () {
                      Get.back();
                      Get.offAllNamed(AppRoutes.signIn);
                      Get.snackbar(
                        'Account Deleted',
                        'Your account data has been removed.',
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: AppColors.dangerRed,
                        colorText: Colors.white,
                      );
                    },
                  );
                },
                showChevron: false,
              ),
              const Divider(height: 1, color: Color(0xFFEBEBEB)),

              _buildSettingItem(
                icon: Icons.logout_rounded,
                title: 'Log Out',
                onTap: () {
                  Get.offAllNamed(AppRoutes.signIn);
                  Get.snackbar(
                    'Logged Out',
                    'You have been logged out successfully.',
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: AppColors.primaryTeal,
                    colorText: Colors.white,
                  );
                },
                showChevron: false,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    required bool showChevron,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Row(
          children: [
            Icon(
              icon,
              color: AppColors.textDark,
              size: 24,
            ),
            const SizedBox(width: 18),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textDark,
                ),
              ),
            ),
            if (showChevron)
              const Icon(
                Icons.chevron_right_rounded,
                color: AppColors.textDark,
                size: 24,
              ),
          ],
        ),
      ),
    );
  }
}

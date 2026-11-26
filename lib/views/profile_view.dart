import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/app_assets.dart';
import '../constants/app_colors.dart';
import '../controllers/profile_controller.dart';
import '../routes/app_routes.dart';
import '../widgets/custom_back_button.dart';
import '../widgets/custom_bottom_nav.dart';
import '../widgets/custom_button.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<ProfileController>()) {
      Get.put(ProfileController());
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const SizedBox(height: 12),

              // Header (Profile title + Settings Gear Icon)
              Row(
                children: [
                  const CustomBackButton(),
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Profile',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textDark,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.toNamed(AppRoutes.settings),
                    child: const Icon(
                      Icons.settings_rounded,
                      color: AppColors.textDark,
                      size: 26,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Profile Card (Avatar with Teal border + User Info + Edit pencil)
              Obx(
                () {
                  final user = controller.user.value;
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Avatar with teal border
                      Container(
                        padding: const EdgeInsets.all(2.5),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.primaryTeal,
                            width: 2.5,
                          ),
                        ),
                        child: ClipOval(
                          child: SizedBox(
                            width: 86,
                            height: 86,
                            child: Image.asset(
                              AppAssets.profileAvatar,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),

                      // User Info
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              user.fullName,
                              style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: AppColors.primaryTeal,
                              ),
                            ),
                            const SizedBox(height: 3),
                            Text(
                              user.email.isNotEmpty ? user.email : 'albertflores@mail.com',
                              style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 13,
                                color: AppColors.textDark,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              user.phoneNumber,
                              style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 13,
                                color: AppColors.textGrey,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              user.address,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 12,
                                color: AppColors.textGrey,
                                height: 1.3,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Edit Profile Pencil Icon
                      GestureDetector(
                        onTap: () => Get.toNamed(AppRoutes.editProfile),
                        child: const Padding(
                          padding: EdgeInsets.only(top: 4.0),
                          child: Icon(
                            Icons.edit,
                            color: AppColors.textDark,
                            size: 22,
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),

              const SizedBox(height: 24),

              // Tabs: Ongoing vs History (User profile-1.jpg vs User profile.jpg)
              Obx(
                () => Row(
                  children: [
                    _buildTabItem(title: 'Ongoing', index: 0),
                    _buildTabItem(title: 'History', index: 1),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Orders List
              Expanded(
                child: Obx(
                  () {
                    final isOngoing = controller.selectedTabIndex.value == 0;
                    final list = isOngoing ? controller.ongoingOrders : controller.historyOrders;

                    return ListView.separated(
                      itemCount: list.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 14),
                      itemBuilder: (context, index) {
                        final order = list[index];
                        return Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: const Color(0xFFEBEBEB),
                              width: 1.2,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withValues(alpha: 0.02),
                                blurRadius: 8,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                  style: const TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.textDark,
                                  ),
                                  children: [
                                    const TextSpan(text: 'Order ID '),
                                    TextSpan(
                                      text: order.orderIdDisplay,
                                      style: const TextStyle(
                                        color: AppColors.accentGold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 8),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    order.date,
                                    style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 13,
                                      color: AppColors.textGrey,
                                    ),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      style: const TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 13,
                                        color: AppColors.textGrey,
                                      ),
                                      children: [
                                        const TextSpan(text: 'Expected Delivery: '),
                                        TextSpan(
                                          text: order.expectedDelivery,
                                          style: const TextStyle(
                                            color: AppColors.textDark,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 4),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      style: const TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 13,
                                        color: AppColors.textGrey,
                                      ),
                                      children: [
                                        const TextSpan(text: 'Items '),
                                        TextSpan(
                                          text: '${order.itemsCount}',
                                          style: const TextStyle(
                                            color: AppColors.textDark,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  RichText(
                                    text: TextSpan(
                                      style: const TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 13,
                                        color: AppColors.textGrey,
                                      ),
                                      children: [
                                        const TextSpan(text: 'Total Amount: '),
                                        TextSpan(
                                          text: order.totalAmountDisplay,
                                          style: const TextStyle(
                                            color: AppColors.textDark,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 12),

                              // Action Button (Re-Order or Track Order)
                              CustomButton(
                                text: isOngoing ? 'Track Order' : 'Re-Order',
                                height: 42,
                                borderRadius: 10,
                                onPressed: () {
                                  if (isOngoing) {
                                    Get.toNamed(AppRoutes.orderTracking);
                                  } else {
                                    Get.snackbar(
                                      'Order Re-Ordered',
                                      'Items from ${order.orderIdDisplay} added to your cart!',
                                      snackPosition: SnackPosition.BOTTOM,
                                      backgroundColor: AppColors.primaryTeal,
                                      colorText: Colors.white,
                                    );
                                    Get.toNamed(AppRoutes.cart);
                                  }
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNav(currentIndex: 2),
    );
  }

  Widget _buildTabItem({required String title, required int index}) {
    final isSelected = controller.selectedTabIndex.value == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => controller.changeTab(index),
        behavior: HitTestBehavior.opaque,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                title,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: isSelected ? AppColors.primaryTeal : AppColors.textGrey,
                ),
              ),
            ),
            Container(
              height: 2.5,
              color: isSelected ? AppColors.primaryTeal : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}

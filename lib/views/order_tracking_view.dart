import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/app_assets.dart';
import '../constants/app_colors.dart';
import '../controllers/checkout_controller.dart';
import '../widgets/custom_back_button.dart';

class OrderTrackingView extends GetView<CheckoutController> {
  const OrderTrackingView({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<CheckoutController>()) {
      Get.put(CheckoutController());
    }

    final order = controller.activeOrder.value;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          // Background stylized map image
          Positioned.fill(
            bottom: 220,
            child: Image.asset(
              AppAssets.orderMap,
              fit: BoxFit.cover,
            ),
          ),

          // Top Navigation Bar
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Row(
              children: [
                const CustomBackButton(isDark: true),
                const SizedBox(width: 16),
                const Text(
                  'Track Order',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textDark,
                  ),
                ),
              ],
            ),
          ),

          // Bottom Sliding Sheet
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Obx(
              () {
                final isExpanded = controller.isTrackingSheetExpanded.value;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.12),
                        blurRadius: 20,
                        offset: const Offset(0, -4),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Drag Handle Bar
                      GestureDetector(
                        onTap: controller.toggleTrackingSheet,
                        child: Center(
                          child: Container(
                            width: 50,
                            height: 5,
                            decoration: BoxDecoration(
                              color: const Color(0xFFD2D8E0),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Restaurant & Order Info Header
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(14),
                            child: SizedBox(
                              width: 62,
                              height: 62,
                              child: Image.asset(
                                AppAssets.restaurant,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(width: 14),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  order.restaurantName,
                                  style: const TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: AppColors.textDark,
                                  ),
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  'Orderd At ${order.orderTime}',
                                  style: const TextStyle(
                                    fontFamily: 'Poppins',
                                    fontSize: 13,
                                    color: AppColors.textGrey,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                for (final item in order.summaryItems)
                                  Text(
                                    item,
                                    style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF4A4A4A),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      // Expanded Details (Tracking Order_02.png)
                      if (isExpanded) ...[
                        const SizedBox(height: 20),

                        // Estimated Delivery Time
                        const Text(
                          '20 min',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 34,
                            fontWeight: FontWeight.w800,
                            color: Color(0xFF1B2430),
                          ),
                        ),
                        const Text(
                          'ESTIMATED DELIVERY TIME',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1.2,
                            color: Color(0xFFA0A5AA),
                          ),
                        ),

                        const SizedBox(height: 24),

                        // Delivery Steps Timeline
                        _buildTimelineStep(
                          icon: Icons.check_circle,
                          color: AppColors.orangeAccent,
                          title: 'Your order has been received',
                          isCompleted: true,
                          showLine: true,
                        ),
                        _buildTimelineStep(
                          icon: Icons.autorenew_rounded,
                          color: AppColors.orangeAccent,
                          title: 'The restaurant is preparing your food',
                          isCompleted: true,
                          showLine: true,
                        ),
                        _buildTimelineStep(
                          icon: Icons.check_circle,
                          color: const Color(0xFFBDBDBD),
                          title: 'Your order has been picked up for delivery',
                          isCompleted: false,
                          showLine: true,
                        ),
                        _buildTimelineStep(
                          icon: Icons.check_circle,
                          color: const Color(0xFFBDBDBD),
                          title: 'Order arriving soon!',
                          isCompleted: false,
                          showLine: false,
                        ),

                        const SizedBox(height: 18),

                        // Courier Info Card (Robert F.)
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(
                              color: const Color(0xFFEBEBEB),
                              width: 1.2,
                            ),
                          ),
                          child: Row(
                            children: [
                              ClipOval(
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: Image.asset(
                                    AppAssets.courier,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 14),
                              const Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Robert F.',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        color: AppColors.textDark,
                                      ),
                                    ),
                                    Text(
                                      'Courier',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 13,
                                        color: AppColors.textGrey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 48,
                                height: 48,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFFF6D00),
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0x55FF6D00),
                                      blurRadius: 10,
                                      offset: Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: IconButton(
                                  icon: const Icon(
                                    Icons.phone,
                                    color: Colors.white,
                                    size: 22,
                                  ),
                                  onPressed: () {
                                    Get.snackbar(
                                      'Calling Courier',
                                      'Connecting with Robert F...',
                                      snackPosition: SnackPosition.TOP,
                                      backgroundColor: const Color(0xFFFF6D00),
                                      colorText: Colors.white,
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineStep({
    required IconData icon,
    required Color color,
    required String title,
    required bool isCompleted,
    required bool showLine,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Icon(icon, color: color, size: 20),
            if (showLine)
              Container(
                width: 2,
                height: 26,
                color: color.withValues(alpha: 0.6),
              ),
          ],
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 13.5,
              fontWeight: isCompleted ? FontWeight.w500 : FontWeight.w400,
              color: isCompleted ? AppColors.orangeAccent : const Color(0xFF8E8E93),
            ),
          ),
        ),
      ],
    );
  }
}

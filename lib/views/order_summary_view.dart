import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/app_colors.dart';
import '../controllers/cart_controller.dart';
import '../routes/app_routes.dart';
import '../widgets/custom_back_button.dart';
import '../widgets/custom_button.dart';

class OrderSummaryView extends GetView<CartController> {
  const OrderSummaryView({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<CartController>()) {
      Get.put(CartController());
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
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
                            'Order Summary',
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

                  // Order ID Header
                  RichText(
                    text: const TextSpan(
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textDark,
                      ),
                      children: [
                        TextSpan(text: 'Order ID '),
                        TextSpan(
                          text: '#1947034',
                          style: TextStyle(
                            color: AppColors.accentGold,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 14),
                ],
              ),
            ),

            // Item Breakdown Cards
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ListView(
                  children: [
                    _buildSummaryCard(title: 'Noodle Ex (3)', price: 'Rs 1,500'),
                    const SizedBox(height: 12),
                    _buildSummaryCard(title: 'Noodle Ex (3)', price: 'Rs 1,500'),
                    const SizedBox(height: 12),
                    _buildSummaryCard(title: 'Noodle Ex (3)', price: 'Rs 1,500'),
                    const SizedBox(height: 12),
                    _buildSummaryCard(title: 'Delivery Charges', price: 'Rs 1,500'),
                  ],
                ),
              ),
            ),

            // Bottom Sticky Total Card as seen in Cart-1.png
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 22,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primaryTeal,
                        ),
                      ),
                      Obx(
                        () => Text(
                          'Rs ${controller.total > 0 ? controller.total.toInt().toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},') : '1,000'}',
                          style: const TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primaryTeal,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  CustomButton(
                    text: 'Continue',
                    height: 52,
                    borderRadius: 14,
                    onPressed: () {
                      Get.toNamed(AppRoutes.addressList);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSummaryCard({required String title, required String price}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xFFEBEBEB),
          width: 1.2,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: AppColors.textDark,
            ),
          ),
          Text(
            price,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: AppColors.textDark,
            ),
          ),
        ],
      ),
    );
  }
}

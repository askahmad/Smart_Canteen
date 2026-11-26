import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/app_colors.dart';
import '../controllers/checkout_controller.dart';
import '../routes/app_routes.dart';
import '../widgets/custom_back_button.dart';
import '../widgets/custom_button.dart';

class PaymentMethodsView extends GetView<CheckoutController> {
  const PaymentMethodsView({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<CheckoutController>()) {
      Get.put(CheckoutController());
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
                            'Payment Methods',
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

                  const SizedBox(height: 28),

                  // Credit & Debit Card Section
                  const Text(
                    'Credit & Debit Card',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textDark,
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Add Card Option
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.addCard);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
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
                      child: Row(
                        children: [
                          Container(
                            width: 38,
                            height: 26,
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFB300),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Center(
                              child: Icon(
                                Icons.credit_card_rounded,
                                color: Colors.white,
                                size: 18,
                              ),
                            ),
                          ),
                          const SizedBox(width: 14),
                          const Expanded(
                            child: Text(
                              'Add Card',
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: AppColors.textDark,
                              ),
                            ),
                          ),
                          const Icon(
                            Icons.chevron_right_rounded,
                            color: Color(0xFFFFA000),
                            size: 26,
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 28),

                  // More Payment Options Section
                  const Text(
                    'More Payment Options',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textDark,
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Payment Options Container
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: const Color(0xFFEBEBEB),
                        width: 1.2,
                      ),
                    ),
                    child: Column(
                      children: [
                        _buildPaymentRow(
                          iconWidget: const Icon(
                            Icons.paypal,
                            color: Color(0xFF003087),
                            size: 24,
                          ),
                          title: 'Paypal',
                          methodKey: 'paypal',
                        ),
                        const Divider(height: 1, color: Color(0xFFF0F0F0)),
                        _buildPaymentRow(
                          iconWidget: const Icon(
                            Icons.apple,
                            color: Colors.black,
                            size: 26,
                          ),
                          title: 'Apple Pay',
                          methodKey: 'apple',
                        ),
                        const Divider(height: 1, color: Color(0xFFF0F0F0)),
                        _buildPaymentRow(
                          iconWidget: Container(
                            width: 24,
                            height: 24,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            child: const Center(
                              child: Text(
                                'G',
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 20,
                                  color: Color(0xFF4285F4),
                                ),
                              ),
                            ),
                          ),
                          title: 'Google Pay',
                          methodKey: 'google',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const Spacer(),

            // Bottom Sticky Bar (Proceed to Payment / Pay & Confirm)
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
                text: 'Pay & Confirm',
                height: 52,
                borderRadius: 14,
                onPressed: () {
                  Get.offNamed(AppRoutes.paymentSuccess);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentRow({
    required Widget iconWidget,
    required String title,
    required String methodKey,
  }) {
    return Obx(
      () {
        final isSelected = controller.selectedPaymentMethod.value == methodKey;
        return InkWell(
          onTap: () => controller.selectPaymentMethod(methodKey),
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
            child: Row(
              children: [
                iconWidget,
                const SizedBox(width: 16),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: AppColors.textDark,
                    ),
                  ),
                ),
                if (isSelected)
                  const Icon(
                    Icons.check_circle_rounded,
                    color: AppColors.primaryTeal,
                    size: 22,
                  )
                else
                  const Icon(
                    Icons.chevron_right_rounded,
                    color: Color(0xFFFFA000),
                    size: 24,
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

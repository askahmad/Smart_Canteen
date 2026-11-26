import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/app_colors.dart';
import '../controllers/checkout_controller.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class AddCardView extends GetView<CheckoutController> {
  const AddCardView({super.key});

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

                  // Header with Circular Close Button
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: Container(
                          width: 44,
                          height: 44,
                          decoration: const BoxDecoration(
                            color: Color(0xFFECEEF2),
                            shape: BoxShape.circle,
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.close_rounded,
                              color: AppColors.textDark,
                              size: 22,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 18),
                      const Text(
                        'Add Card',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textDark,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 32),

                  // Card Holder Name
                  CustomTextField(
                    label: 'Card Holder Name',
                    hintText: 'Enter Name',
                    controller: controller.cardHolderController,
                  ),

                  const SizedBox(height: 20),

                  // Card Number
                  CustomTextField(
                    label: 'Card Number',
                    hintText: '1253 ---- ---- ----',
                    controller: controller.cardNumberController,
                    keyboardType: TextInputType.number,
                  ),

                  const SizedBox(height: 20),

                  // Expire Date & CVV Row
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextField(
                          label: 'Expire Date',
                          hintText: 'mm/yyyy',
                          controller: controller.cardExpiryController,
                          keyboardType: TextInputType.datetime,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: CustomTextField(
                          label: 'CVV',
                          hintText: '***',
                          controller: controller.cardCvvController,
                          obscureText: true,
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const Spacer(),

            // Bottom Sticky Bar (Add New Card button)
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
                text: 'Add New Card',
                height: 52,
                borderRadius: 14,
                onPressed: () {
                  controller.addNewCard();
                  Get.back();
                  Get.snackbar(
                    'Card Added',
                    'Payment card saved successfully.',
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

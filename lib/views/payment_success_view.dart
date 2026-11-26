import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/app_assets.dart';
import '../constants/app_colors.dart';
import '../routes/app_routes.dart';
import '../widgets/custom_button.dart';

class PaymentSuccessView extends StatelessWidget {
  const PaymentSuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(flex: 2),

            // Confetti Illustration
            Center(
              child: SizedBox(
                width: 220,
                height: 220,
                child: Image.asset(
                  AppAssets.confetti,
                  fit: BoxFit.contain,
                ),
              ),
            ),

            const SizedBox(height: 36),

            // Congratulations Heading
            const Text(
              'Congratulations!',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 26,
                fontWeight: FontWeight.w700,
                color: AppColors.textDark,
              ),
            ),

            const SizedBox(height: 12),

            // Subtitle
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Text(
                'You successfully made a payment, enjoy our service!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AppColors.textGrey,
                  height: 1.5,
                ),
              ),
            ),

            const Spacer(flex: 3),

            // Bottom Sticky Bar (Back To Home button)
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
                text: 'Back To Home',
                height: 52,
                borderRadius: 14,
                onPressed: () {
                  Get.offAllNamed(AppRoutes.home);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/app_colors.dart';
import '../constants/app_assets.dart';
import '../controllers/splash_controller.dart';

class SplsshView extends GetView<SplashController> {
  const SplsshView({super.key});

  @override
  Widget build(BuildContext context) {
    // Controller is initialized via binding
    return Scaffold(
      backgroundColor: AppColors.primaryTeal,
      body: Center(
        child: SizedBox(
          width: 200,
          height: 200,
          child: Image.asset(
            AppAssets.canteenSplash,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}

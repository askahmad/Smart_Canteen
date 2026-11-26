import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/app_colors.dart';

class CustomBackButton extends StatelessWidget {
  final VoidCallback? onTap;
  final bool isDark;

  const CustomBackButton({
    super.key,
    this.onTap,
    this.isDark = false,
  });

  @override
  Widget build(BuildContext context) {
    if (isDark) {
      return GestureDetector(
        onTap: onTap ?? () => Get.back(),
        child: Container(
          width: 42,
          height: 42,
          decoration: const BoxDecoration(
            color: Color(0xFF1E222B),
            shape: BoxShape.circle,
          ),
          child: const Center(
            child: Icon(
              Icons.chevron_left_rounded,
              color: Colors.white,
              size: 26,
            ),
          ),
        ),
      );
    }

    return GestureDetector(
      onTap: onTap ?? () => Get.back(),
      child: Container(
        width: 42,
        height: 42,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: const Color(0xFFE5E7EB),
            width: 1.2,
          ),
        ),
        child: const Center(
          child: Icon(
            Icons.chevron_left_rounded,
            color: AppColors.primaryTeal,
            size: 26,
          ),
        ),
      ),
    );
  }
}

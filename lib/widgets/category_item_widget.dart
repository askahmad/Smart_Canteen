import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../models/category_model.dart';

class CategoryItemWidget extends StatelessWidget {
  final CategoryModel category;
  final VoidCallback? onTap;

  const CategoryItemWidget({
    super.key,
    required this.category,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          SizedBox(
            width: 62,
            height: 62,
            child: Image.asset(
              category.image,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            category.name,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: AppColors.textDark,
            ),
          ),
        ],
      ),
    );
  }
}

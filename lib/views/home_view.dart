import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/app_colors.dart';
import '../constants/app_assets.dart';
import '../controllers/home_controller.dart';
import '../routes/app_routes.dart';
import '../widgets/category_item_widget.dart';
import '../widgets/custom_bottom_nav.dart';
import '../widgets/food_card_widget.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<HomeController>()) {
      Get.put(HomeController());
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),

              // Header: Avatar, Name, Location, Bell
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Get.toNamed(AppRoutes.profile),
                    child: Container(
                      width: 48,
                      height: 48,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          AppAssets.userAvatar,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Amirul Hakim',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColors.accentGold,
                        ),
                      ),
                      Text(
                        'Italy',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.textGrey,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      Get.snackbar(
                        'Notifications',
                        'You have no new notifications right now.',
                        snackPosition: SnackPosition.TOP,
                        backgroundColor: AppColors.primaryTeal,
                        colorText: Colors.white,
                      );
                    },
                    icon: const Icon(
                      Icons.notifications,
                      color: AppColors.textDark,
                      size: 26,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Greeting
              RichText(
                text: const TextSpan(
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 18,
                    color: AppColors.textDark,
                  ),
                  children: [
                    TextSpan(
                      text: 'Hey Halal, ',
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ),
                    TextSpan(
                      text: 'Good Afternoon!',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 22),

              // Categories Header with "See All >"
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Categories',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppColors.textDark,
                    ),
                  ),
                  GestureDetector(
                    onTap: () => Get.toNamed(AppRoutes.categories),
                    child: const Row(
                      children: [
                        Text(
                          'See All ',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFF4A4A4A),
                          ),
                        ),
                        Icon(
                          Icons.chevron_right,
                          size: 18,
                          color: Color(0xFF4A4A4A),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Horizontal Categories List
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: controller.categories
                      .map(
                        (cat) => CategoryItemWidget(
                          category: cat,
                          onTap: () {
                            Get.toNamed(
                              AppRoutes.categoryDetail,
                              arguments: {'category': cat.name},
                            );
                          },
                        ),
                      )
                      .toList(),
                ),
              ),

              const SizedBox(height: 26),

              // Most Popular Header
              const Text(
                'Most Popular',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                  color: AppColors.textDark,
                ),
              ),

              const SizedBox(height: 16),

              // Most Popular 2-Column Grid
              Obx(
                () => GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.popularItems.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.76,
                  ),
                  itemBuilder: (context, index) {
                    final item = controller.popularItems[index];
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(
                          AppRoutes.categoryDetail,
                          arguments: {'category': item.category},
                        );
                      },
                      child: FoodCardWidget(
                        item: item,
                        onAdd: () => controller.addToCart(item),
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const CustomBottomNav(currentIndex: 0),
    );
  }
}

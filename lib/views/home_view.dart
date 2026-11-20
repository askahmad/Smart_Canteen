import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/app_colors.dart';
import '../constants/app_assets.dart';
import '../controllers/home_controller.dart';
import '../widgets/category_item_widget.dart';
import '../widgets/food_card_widget.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
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
                  Container(
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

              // Categories Header
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
                    onTap: () {},
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

              // Categories List (from GetX Controller)
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: controller.categories
                      .map(
                        (cat) => CategoryItemWidget(
                          category: cat,
                          onTap: () {
                            Get.snackbar(
                              'Category Selected',
                              'Viewing ${cat.name}',
                              snackPosition: SnackPosition.BOTTOM,
                              duration: const Duration(milliseconds: 800),
                              backgroundColor: AppColors.primaryTeal,
                              colorText: Colors.white,
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

              // Most Popular Grid (from GetX Controller)
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
                    return FoodCardWidget(
                      item: item,
                      onAdd: () => controller.addToCart(item),
                    );
                  },
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(
              color: Colors.grey.shade200,
              width: 1,
            ),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(
                    index: 0,
                    icon: Icons.home_rounded,
                    label: 'Home',
                    isActive: controller.currentNavIndex.value == 0,
                    activeColor: AppColors.accentGold,
                    onTap: () => controller.changeNavIndex(0),
                  ),
                  _buildNavItem(
                    index: 1,
                    icon: Icons.shopping_cart_outlined,
                    label: 'Cart',
                    isActive: controller.currentNavIndex.value == 1,
                    activeColor: AppColors.accentGold,
                    badgeCount: controller.cartCount.value,
                    onTap: () => controller.changeNavIndex(1),
                  ),
                  _buildNavItem(
                    index: 2,
                    icon: Icons.person_outline_rounded,
                    label: 'Profile',
                    isActive: controller.currentNavIndex.value == 2,
                    activeColor: AppColors.accentGold,
                    onTap: () => controller.changeNavIndex(2),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required int index,
    required IconData icon,
    required String label,
    required bool isActive,
    required Color activeColor,
    required VoidCallback onTap,
    int badgeCount = 0,
  }) {
    final color = isActive ? activeColor : AppColors.textGrey;
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Icon(icon, color: color, size: 26),
              if (badgeCount > 0)
                Positioned(
                  right: -6,
                  top: -4,
                  child: Container(
                    padding: const EdgeInsets.all(3),
                    decoration: const BoxDecoration(
                      color: AppColors.primaryTeal,
                      shape: BoxShape.circle,
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 14,
                      minHeight: 14,
                    ),
                    child: Text(
                      '$badgeCount',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        color: Colors.white,
                        fontSize: 9,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 3),
          Text(
            label,
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 11,
              fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

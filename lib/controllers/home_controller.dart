import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/app_assets.dart';
import '../constants/app_colors.dart';
import '../models/category_model.dart';
import '../models/food_item_model.dart';

class HomeController extends GetxController {
  final currentNavIndex = 0.obs;
  final cartCount = 0.obs;

  final categories = <CategoryModel>[
    CategoryModel(name: 'Pizza', image: AppAssets.pizza),
    CategoryModel(name: 'Burger', image: AppAssets.burger),
    CategoryModel(name: 'Shawarma', image: AppAssets.shawarma),
    CategoryModel(name: 'Rolls', image: AppAssets.rolls),
  ].obs;

  final popularItems = <FoodItemModel>[
    FoodItemModel(
      id: '1',
      name: 'Peri Peri Pizza Small',
      price: 'Rs 500',
      image: AppAssets.pizza,
      category: 'Pizza',
    ),
    FoodItemModel(
      id: '2',
      name: 'Peri Peri Pizza Small',
      price: 'Rs 500',
      image: AppAssets.pizza,
      category: 'Pizza',
    ),
    FoodItemModel(
      id: '3',
      name: 'Peri Peri Pizza Small',
      price: 'Rs 500',
      image: AppAssets.pizza,
      category: 'Pizza',
    ),
    FoodItemModel(
      id: '4',
      name: 'Peri Peri Pizza Small',
      price: 'Rs 500',
      image: AppAssets.pizza,
      category: 'Pizza',
    ),
  ].obs;

  void changeNavIndex(int index) {
    currentNavIndex.value = index;
  }

  void addToCart(FoodItemModel item) {
    cartCount.value++;
    Get.snackbar(
      'Added to Cart',
      '${item.name} added to your tray!',
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(milliseconds: 900),
      backgroundColor: AppColors.primaryTeal,
      colorText: Colors.white,
      margin: const EdgeInsets.all(16),
    );
  }
}

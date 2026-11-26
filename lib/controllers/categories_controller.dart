import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/app_assets.dart';
import '../models/category_model.dart';
import '../models/food_item_model.dart';

class CategoriesController extends GetxController {
  final searchController = TextEditingController();
  final searchQuery = ''.obs;

  final allCategories = <CategoryModel>[
    CategoryModel(name: 'Pizza', image: AppAssets.pizza),
    CategoryModel(name: 'Burger', image: AppAssets.burger),
    CategoryModel(name: 'Shawarma', image: AppAssets.shawarma),
    CategoryModel(name: 'Rolls', image: AppAssets.rolls),
    CategoryModel(name: 'Pizza', image: AppAssets.pizza),
    CategoryModel(name: 'Rolls', image: AppAssets.rolls),
    CategoryModel(name: 'Burger', image: AppAssets.burger),
    CategoryModel(name: 'Pizza', image: AppAssets.pizza),
  ].obs;

  List<CategoryModel> get filteredCategories {
    if (searchQuery.value.trim().isEmpty) {
      return allCategories;
    }
    return allCategories
        .where((cat) => cat.name.toLowerCase().contains(searchQuery.value.toLowerCase()))
        .toList();
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}

class CategoryDetailController extends GetxController {
  final searchController = TextEditingController();
  final searchQuery = ''.obs;
  final categoryName = 'Pizza'.obs;

  final selectedQuantity = 2.obs;
  final selectedItemPrice = 32.0.obs; // As in Pizza.png $32 / Rs 500

  final items = <FoodItemModel>[
    FoodItemModel(
      id: 'pizza_1',
      name: 'Peri Peri Pizza Small',
      price: 'Rs 500',
      numericPrice: 500.0,
      image: AppAssets.pizza,
      category: 'Pizza',
    ),
    FoodItemModel(
      id: 'pizza_2',
      name: 'Peri Peri Pizza Small',
      price: 'Rs 500',
      numericPrice: 500.0,
      image: AppAssets.pizza,
      category: 'Pizza',
    ),
    FoodItemModel(
      id: 'pizza_3',
      name: 'Peri Peri Pizza Small',
      price: 'Rs 500',
      numericPrice: 500.0,
      image: AppAssets.pizza,
      category: 'Pizza',
    ),
    FoodItemModel(
      id: 'pizza_4',
      name: 'Peri Peri Pizza Small',
      price: 'Rs 500',
      numericPrice: 500.0,
      image: AppAssets.pizza,
      category: 'Pizza',
    ),
  ].obs;

  List<FoodItemModel> get filteredItems {
    if (searchQuery.value.trim().isEmpty) {
      return items;
    }
    return items
        .where((item) => item.name.toLowerCase().contains(searchQuery.value.toLowerCase()))
        .toList();
  }

  void incrementQuantity() {
    selectedQuantity.value++;
  }

  void decrementQuantity() {
    if (selectedQuantity.value > 1) {
      selectedQuantity.value--;
    }
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }
}

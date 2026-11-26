import 'food_item_model.dart';

class CartItemModel {
  final String id;
  final FoodItemModel item;
  int quantity;

  CartItemModel({
    required this.id,
    required this.item,
    this.quantity = 1,
  });

  double get totalPrice => item.numericPrice * quantity;
}

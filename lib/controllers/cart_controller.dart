import 'package:get/get.dart';
import '../constants/app_assets.dart';
import '../models/food_item_model.dart';
import '../models/cart_item_model.dart';

class CartController extends GetxController {
  final cartItems = <CartItemModel>[].obs;
  final deliveryCharge = 1500.0.obs;

  @override
  void onInit() {
    super.onInit();
    _loadDefaultCart();
  }

  void _loadDefaultCart() {
    // Pre-populate according to Cart.png screen design
    final noodleItem = FoodItemModel(
      id: 'noodle_1',
      name: 'Noodle Ex',
      price: 'Rs 500',
      numericPrice: 500.0,
      image: AppAssets.noodle,
      category: 'Noodles',
    );

    cartItems.addAll([
      CartItemModel(id: 'c1', item: noodleItem, quantity: 3),
      CartItemModel(id: 'c2', item: noodleItem, quantity: 3),
    ]);
  }

  int get totalItemCount => cartItems.fold(0, (sum, item) => sum + item.quantity);

  double get subtotal => cartItems.fold(0.0, (sum, item) => sum + item.totalPrice);

  double get total => subtotal + (cartItems.isEmpty ? 0 : deliveryCharge.value);

  void addItem(FoodItemModel item, {int quantity = 1}) {
    final existingIndex = cartItems.indexWhere((element) => element.item.id == item.id);
    if (existingIndex >= 0) {
      cartItems[existingIndex].quantity += quantity;
      cartItems.refresh();
    } else {
      cartItems.add(CartItemModel(
        id: 'cart_${DateTime.now().millisecondsSinceEpoch}',
        item: item,
        quantity: quantity,
      ));
    }
  }

  void incrementQuantity(int index) {
    if (index >= 0 && index < cartItems.length) {
      cartItems[index].quantity++;
      cartItems.refresh();
    }
  }

  void decrementQuantity(int index) {
    if (index >= 0 && index < cartItems.length) {
      if (cartItems[index].quantity > 1) {
        cartItems[index].quantity--;
        cartItems.refresh();
      } else {
        removeItem(index);
      }
    }
  }

  void removeItem(int index) {
    if (index >= 0 && index < cartItems.length) {
      cartItems.removeAt(index);
    }
  }

  void clearCart() {
    cartItems.clear();
  }
}

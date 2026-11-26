import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/address_model.dart';
import '../models/order_model.dart';

class CheckoutController extends GetxController {
  // Address List (as shown in Address.png)
  final savedAddresses = <AddressModel>[
    AddressModel(
      id: 'addr_1',
      type: 'HOME',
      addressLine: '2464 Royal Ln. Mesa, New Jersey 45463',
      isDefault: true,
    ),
    AddressModel(
      id: 'addr_2',
      type: 'WORK',
      addressLine: '3891 Ranchview Dr. Richardson, California 62639',
    ),
  ].obs;

  // Add Delivery Address form controllers (Add Delivery Address.png)
  final deliveryAddressController = TextEditingController(
    text: '6Q68+7FM, Tullamulla, Saloora, Jammu and Kashmir, 191201',
  );
  final deliveryInstructionsController = TextEditingController(
    text:
        'Please deliver the package to the following address: 6Q68+7FM, Tullamulla, Saloora, Jammu and Kashmir, 191201. Ensure that the recipient is available to receive the package and confirm delivery upon arrival.',
  );

  // Add New Address Form Controllers (Address-1.png)
  final newAddressTypeController = TextEditingController();
  final newAddressLineController = TextEditingController();
  final newCityController = TextEditingController();
  final newStateController = TextEditingController();
  final newZipController = TextEditingController();
  final newCountryController = TextEditingController();

  // Payment State (Payment methods.png, Payment methods-1.png)
  final selectedPaymentMethod = 'card'.obs; // 'card', 'paypal', 'apple', 'google'
  final savedCards = <Map<String, String>>[
    {
      'holder': 'Steve Harvey',
      'number': '**** **** **** 1253',
      'expiry': '12/28',
    }
  ].obs;

  // Add Card Form Controllers (Add Card.png)
  final cardHolderController = TextEditingController();
  final cardNumberController = TextEditingController();
  final cardExpiryController = TextEditingController();
  final cardCvvController = TextEditingController();

  // Active Order & Tracking (Tracking Order_01.png & Tracking Order_02.png)
  final activeOrder = Rx<OrderModel>(
    OrderModel(
      id: 'order_1947034',
      orderIdDisplay: '#1947034',
      date: '05-12-2019',
      expectedDelivery: '20 Mins',
      itemsCount: 3,
      totalAmount: 1500.0,
      totalAmountDisplay: 'Rs 1,500',
      status: 'Ongoing',
      restaurantName: 'Uttora Coffee House',
      orderTime: '06 Sept, 10:00pm',
      summaryItems: ['2x Burger', '4x Sanwitch'],
      progressStep: 1, // 0: received, 1: preparing, 2: picked up, 3: arriving soon
    ),
  );

  final isTrackingSheetExpanded = true.obs;

  void toggleTrackingSheet() {
    isTrackingSheetExpanded.value = !isTrackingSheetExpanded.value;
  }

  void selectPaymentMethod(String method) {
    selectedPaymentMethod.value = method;
  }

  void addNewAddress() {
    final type = newAddressTypeController.text.trim();
    final line = newAddressLineController.text.trim();
    if (line.isEmpty) return;

    savedAddresses.add(
      AddressModel(
        id: 'addr_${DateTime.now().millisecondsSinceEpoch}',
        type: type.isEmpty ? 'OTHER' : type.toUpperCase(),
        addressLine: line,
        city: newCityController.text.trim(),
        state: newStateController.text.trim(),
        zipCode: newZipController.text.trim(),
        country: newCountryController.text.trim(),
      ),
    );

    newAddressTypeController.clear();
    newAddressLineController.clear();
    newCityController.clear();
    newStateController.clear();
    newZipController.clear();
    newCountryController.clear();
  }

  void deleteAddress(String id) {
    savedAddresses.removeWhere((item) => item.id == id);
  }

  void addNewCard() {
    final holder = cardHolderController.text.trim();
    final number = cardNumberController.text.trim();
    if (holder.isEmpty || number.isEmpty) return;

    savedCards.add({
      'holder': holder,
      'number': number.length > 4 ? '**** **** **** ${number.substring(number.length - 4)}' : number,
      'expiry': cardExpiryController.text.trim(),
    });

    cardHolderController.clear();
    cardNumberController.clear();
    cardExpiryController.clear();
    cardCvvController.clear();
  }

  @override
  void onClose() {
    deliveryAddressController.dispose();
    deliveryInstructionsController.dispose();
    newAddressTypeController.dispose();
    newAddressLineController.dispose();
    newCityController.dispose();
    newStateController.dispose();
    newZipController.dispose();
    newCountryController.dispose();
    cardHolderController.dispose();
    cardNumberController.dispose();
    cardExpiryController.dispose();
    cardCvvController.dispose();
    super.onClose();
  }
}

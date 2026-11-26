import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/order_model.dart';
import '../models/user_model.dart';

class ProfileController extends GetxController {
  // Tab index: 0 for Ongoing, 1 for History (User profile.jpg, User profile-1.jpg)
  final selectedTabIndex = 0.obs;

  final user = Rx<UserModel>(
    UserModel(
      uid: 'albert_flores_1',
      fullName: 'Albert Flores',
      phoneNumber: '+000 000 0000 00',
      address: '6Q68+7FM, Tullamulla, Saloora, Jammu and Kashmir, 191201',
      city: 'Saloora',
      state: 'Jammu and Kashmir',
      zipCode: '191201',
      country: 'India',
      email: 'albertflores@mail.com',
    ),
  );

  // Edit Profile Form Controllers (Edit Profile.png)
  final editNameController = TextEditingController(text: 'Steve Harvey');
  final editEmailController = TextEditingController(text: 'example@gmail.com');
  final editPhoneController = TextEditingController(text: '+000 000 0000');
  final editAddressController = TextEditingController(text: 'Address Line 1');
  final editCityController = TextEditingController();
  final editStateController = TextEditingController();
  final editZipController = TextEditingController();
  final editCountryController = TextEditingController();

  // Password Manager Form Controllers (Password Manager.png)
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final isCurrentPasswordHidden = true.obs;
  final isNewPasswordHidden = true.obs;
  final isConfirmPasswordHidden = true.obs;

  // Ongoing Orders (User profile-1.jpg)
  final ongoingOrders = <OrderModel>[
    OrderModel(
      id: 'ord_1',
      orderIdDisplay: '#1947034',
      date: '05-12-2019',
      expectedDelivery: '20 Mins',
      itemsCount: 3,
      totalAmount: 1500.0,
      totalAmountDisplay: 'Rs 1,500',
      status: 'Ongoing',
    ),
    OrderModel(
      id: 'ord_2',
      orderIdDisplay: '#1947034',
      date: '05-12-2019',
      expectedDelivery: '20 Mins',
      itemsCount: 3,
      totalAmount: 1500.0,
      totalAmountDisplay: 'Rs 1,500',
      status: 'Ongoing',
    ),
    OrderModel(
      id: 'ord_3',
      orderIdDisplay: '#1947034',
      date: '05-12-2019',
      expectedDelivery: '20 Mins',
      itemsCount: 3,
      totalAmount: 1500.0,
      totalAmountDisplay: 'Rs 1,500',
      status: 'Ongoing',
    ),
    OrderModel(
      id: 'ord_4',
      orderIdDisplay: '#1947034',
      date: '05-12-2019',
      expectedDelivery: '20 Mins',
      itemsCount: 3,
      totalAmount: 1500.0,
      totalAmountDisplay: 'Rs 1,500',
      status: 'Ongoing',
    ),
  ].obs;

  // History Orders (User profile.jpg)
  final historyOrders = <OrderModel>[
    OrderModel(
      id: 'ord_h1',
      orderIdDisplay: '#1947034',
      date: '05-12-2019',
      expectedDelivery: '20 Mins',
      itemsCount: 3,
      totalAmount: 1500.0,
      totalAmountDisplay: 'Rs 1,500',
      status: 'History',
    ),
    OrderModel(
      id: 'ord_h2',
      orderIdDisplay: '#1947034',
      date: '05-12-2019',
      expectedDelivery: '20 Mins',
      itemsCount: 3,
      totalAmount: 1500.0,
      totalAmountDisplay: 'Rs 1,500',
      status: 'History',
    ),
    OrderModel(
      id: 'ord_h3',
      orderIdDisplay: '#1947034',
      date: '05-12-2019',
      expectedDelivery: '20 Mins',
      itemsCount: 3,
      totalAmount: 1500.0,
      totalAmountDisplay: 'Rs 1,500',
      status: 'History',
    ),
    OrderModel(
      id: 'ord_h4',
      orderIdDisplay: '#1947034',
      date: '05-12-2019',
      expectedDelivery: '20 Mins',
      itemsCount: 3,
      totalAmount: 1500.0,
      totalAmountDisplay: 'Rs 1,500',
      status: 'History',
    ),
  ].obs;

  void changeTab(int index) {
    selectedTabIndex.value = index;
  }

  void updateProfile() {
    user.value = UserModel(
      uid: user.value.uid,
      fullName: editNameController.text.trim(),
      email: editEmailController.text.trim(),
      phoneNumber: editPhoneController.text.trim(),
      address: editAddressController.text.trim(),
      city: editCityController.text.trim(),
      state: editStateController.text.trim(),
      zipCode: editZipController.text.trim(),
      country: editCountryController.text.trim(),
    );
  }

  @override
  void onClose() {
    editNameController.dispose();
    editEmailController.dispose();
    editPhoneController.dispose();
    editAddressController.dispose();
    editCityController.dispose();
    editStateController.dispose();
    editZipController.dispose();
    editCountryController.dispose();
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}

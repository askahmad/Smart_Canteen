import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/app_colors.dart';
import '../controllers/checkout_controller.dart';
import '../routes/app_routes.dart';
import '../widgets/custom_back_button.dart';
import '../widgets/custom_button.dart';

class AddressListView extends GetView<CheckoutController> {
  const AddressListView({super.key});

  @override
  Widget build(BuildContext context) {
    if (!Get.isRegistered<CheckoutController>()) {
      Get.put(CheckoutController());
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 12),

              // Header
              Row(
                children: [
                  const CustomBackButton(),
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Address',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textDark,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 42),
                ],
              ),

              const SizedBox(height: 28),

              // Address Cards List
              Expanded(
                child: Obx(
                  () => ListView.separated(
                    itemCount: controller.savedAddresses.length,
                    separatorBuilder: (_, __) => const SizedBox(height: 18),
                    itemBuilder: (context, index) {
                      final address = controller.savedAddresses[index];
                      return GestureDetector(
                        onTap: () {
                          // Tap to proceed to delivery details with this address
                          controller.deliveryAddressController.text = address.fullAddress;
                          Get.toNamed(AppRoutes.addDeliveryAddress);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: const Color(0xFFECEEF1),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    address.type,
                                    style: const TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.textDark,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          controller.newAddressTypeController.text = address.type;
                                          controller.newAddressLineController.text = address.addressLine;
                                          Get.toNamed(AppRoutes.addNewAddress);
                                        },
                                        child: const Icon(
                                          Icons.edit_outlined,
                                          color: AppColors.editBlue,
                                          size: 20,
                                        ),
                                      ),
                                      const SizedBox(width: 14),
                                      GestureDetector(
                                        onTap: () => controller.deleteAddress(address.id),
                                        child: const Icon(
                                          Icons.delete_outline_rounded,
                                          color: AppColors.orangeAccent,
                                          size: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Text(
                                address.addressLine,
                                style: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 13.5,
                                  color: AppColors.textGrey,
                                  height: 1.4,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),

              // Add New Address Button
              CustomButton(
                text: 'Add New Address',
                height: 52,
                borderRadius: 12,
                onPressed: () {
                  Get.toNamed(AppRoutes.addNewAddress);
                },
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

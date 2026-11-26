import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../constants/app_colors.dart';
import '../controllers/checkout_controller.dart';
import '../widgets/custom_back_button.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_text_field.dart';

class AddNewAddressView extends GetView<CheckoutController> {
  const AddNewAddressView({super.key});

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
            children: [
              const SizedBox(height: 12),

              // Header
              Row(
                children: [
                  const CustomBackButton(),
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Add New Address',
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

              // Form fields
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomTextField(
                        label: 'Type',
                        hintText: 'e.g. Work',
                        controller: controller.newAddressTypeController,
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        label: 'Address',
                        hintText: 'Address Line 1',
                        controller: controller.newAddressLineController,
                      ),
                      const SizedBox(height: 14),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              hintText: 'City',
                              controller: controller.newCityController,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: CustomTextField(
                              hintText: 'State',
                              controller: controller.newStateController,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 14),
                      Row(
                        children: [
                          Expanded(
                            child: CustomTextField(
                              hintText: 'Zip Code',
                              controller: controller.newZipController,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: CustomTextField(
                              hintText: 'Country',
                              controller: controller.newCountryController,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              // Save Button
              CustomButton(
                text: 'Save',
                height: 52,
                borderRadius: 12,
                onPressed: () {
                  controller.addNewAddress();
                  Get.back();
                  Get.snackbar(
                    'Address Saved',
                    'New address added successfully!',
                    snackPosition: SnackPosition.BOTTOM,
                    backgroundColor: AppColors.primaryTeal,
                    colorText: Colors.white,
                  );
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

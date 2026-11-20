import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'constants/app_colors.dart';
import 'routes/app_pages.dart';
import 'services/firebase_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseService.init();
  runApp(const SmartCanteenApp());
}

class SmartCanteenApp extends StatelessWidget {
  const SmartCanteenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Smart Canteen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Poppins',
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryTeal,
          primary: AppColors.primaryTeal,
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    );
  }
}

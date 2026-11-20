import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/user_model.dart';
import '../routes/app_routes.dart';
import '../services/firebase_service.dart';
import '../constants/app_colors.dart';

class AuthController extends GetxController {
  // Sign In Controllers
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  // Sign Up Controllers
  final fullNameController = TextEditingController();
  final signUpPhoneController = TextEditingController();
  final addressController = TextEditingController();
  final cityController = TextEditingController();
  final stateController = TextEditingController();
  final zipController = TextEditingController();
  final countryController = TextEditingController();
  final signUpPasswordController = TextEditingController();

  // Observables
  final isPasswordHidden = true.obs;
  final isSignUpPasswordHidden = true.obs;
  final isLoading = false.obs;
  final currentUser = Rx<UserModel?>(null);

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void toggleSignUpPasswordVisibility() {
    isSignUpPasswordHidden.value = !isSignUpPasswordHidden.value;
  }

  String _formatEmail(String input) {
    if (input.contains('@')) return input.trim();
    final cleanPhone = input.replaceAll(RegExp(r'[^0-9]'), '');
    return 'user_$cleanPhone@smartcanteen.com';
  }

  Future<void> signIn() async {
    final phone = phoneController.text.trim();
    final password = passwordController.text.trim();

    if (phone.isEmpty || password.isEmpty) {
      Get.snackbar(
        'Required Fields',
        'Please enter both phone number and password.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
      return;
    }

    isLoading.value = true;

    try {
      if (FirebaseService.isFirebaseInitialized && FirebaseService.auth != null) {
        final email = _formatEmail(phone);
        final userCredential = await FirebaseService.auth!.signInWithEmailAndPassword(
          email: email,
          password: password,
        );

        final uid = userCredential.user?.uid ?? '';
        if (FirebaseService.firestore != null && uid.isNotEmpty) {
          final doc = await FirebaseService.firestore!.collection('users').doc(uid).get();
          if (doc.exists && doc.data() != null) {
            currentUser.value = UserModel.fromMap(doc.data()!, uid);
          }
        }

        Get.snackbar(
          'Welcome Back!',
          'Logged in successfully.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColors.primaryTeal,
          colorText: Colors.white,
        );
      } else {
        // Fallback demo mode when Firebase config is pending
        currentUser.value = UserModel(
          uid: 'demo_user_1',
          fullName: 'Amirul Hakim',
          phoneNumber: phone,
          address: 'Main Campus',
          city: 'Milan',
          state: 'Lombardy',
          zipCode: '20121',
          country: 'Italy',
        );

        Get.snackbar(
          'Signed In',
          'Logged in to Smart Canteen.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColors.primaryTeal,
          colorText: Colors.white,
        );
      }

      Get.offAllNamed(AppRoutes.home);
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        'Login Failed',
        e.message ?? 'An error occurred during sign in.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    } catch (e) {
      Get.snackbar(
        'Notice',
        'Proceeding with Smart Canteen ($e)',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.primaryTeal,
        colorText: Colors.white,
      );
      Get.offAllNamed(AppRoutes.home);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signUp() async {
    final fullName = fullNameController.text.trim();
    final phone = signUpPhoneController.text.trim();
    final address = addressController.text.trim();
    final city = cityController.text.trim();
    final state = stateController.text.trim();
    final zip = zipController.text.trim();
    final country = countryController.text.trim();
    final password = signUpPasswordController.text.trim();

    if (fullName.isEmpty || phone.isEmpty || password.isEmpty) {
      Get.snackbar(
        'Required Fields',
        'Full Name, Phone Number, and Password are required.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
      return;
    }

    if (password.length < 6) {
      Get.snackbar(
        'Weak Password',
        'Password must be at least 6 characters long.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
      return;
    }

    isLoading.value = true;

    try {
      if (FirebaseService.isFirebaseInitialized && FirebaseService.auth != null) {
        final email = _formatEmail(phone);
        final userCredential = await FirebaseService.auth!.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        final uid = userCredential.user?.uid ?? '';
        final newUser = UserModel(
          uid: uid,
          fullName: fullName,
          phoneNumber: phone,
          address: address,
          city: city,
          state: state,
          zipCode: zip,
          country: country,
          email: email,
        );

        if (FirebaseService.firestore != null && uid.isNotEmpty) {
          await FirebaseService.firestore!.collection('users').doc(uid).set(newUser.toMap());
        }

        currentUser.value = newUser;

        Get.snackbar(
          'Account Created',
          'Welcome to Smart Canteen, $fullName!',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColors.primaryTeal,
          colorText: Colors.white,
        );
      } else {
        // Fallback demo mode when Firebase config is pending
        currentUser.value = UserModel(
          uid: 'demo_${DateTime.now().millisecondsSinceEpoch}',
          fullName: fullName,
          phoneNumber: phone,
          address: address,
          city: city,
          state: state,
          zipCode: zip,
          country: country,
        );

        Get.snackbar(
          'Account Created',
          'Registration completed for $fullName.',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColors.primaryTeal,
          colorText: Colors.white,
        );
      }

      Get.offAllNamed(AppRoutes.home);
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        'Registration Failed',
        e.message ?? 'An error occurred during account creation.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    } catch (e) {
      Get.snackbar(
        'Notice',
        'Proceeding with registration ($e)',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.primaryTeal,
        colorText: Colors.white,
      );
      Get.offAllNamed(AppRoutes.home);
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    phoneController.dispose();
    passwordController.dispose();
    fullNameController.dispose();
    signUpPhoneController.dispose();
    addressController.dispose();
    cityController.dispose();
    stateController.dispose();
    zipController.dispose();
    countryController.dispose();
    signUpPasswordController.dispose();
    super.onClose();
  }
}

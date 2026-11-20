import 'package:flutter/foundation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseService {
  static bool isFirebaseInitialized = false;

  static Future<void> init() async {
    try {
      await Firebase.initializeApp();
      isFirebaseInitialized = true;
      if (kDebugMode) {
        print("Firebase successfully initialized.");
      }
    } catch (e) {
      isFirebaseInitialized = false;
      if (kDebugMode) {
        print("Firebase initialization warning (google-services.json not configured yet): $e");
      }
    }
  }

  static FirebaseAuth? get auth =>
      isFirebaseInitialized ? FirebaseAuth.instance : null;

  static FirebaseFirestore? get firestore =>
      isFirebaseInitialized ? FirebaseFirestore.instance : null;
}

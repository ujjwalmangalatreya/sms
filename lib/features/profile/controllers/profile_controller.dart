import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _db = FirebaseDatabase.instance.ref();

  // Observables
  RxString name = ''.obs;
  RxString phone = ''.obs;
  RxString targetLine = ''.obs;
  RxString website = ''.obs;
  RxString address = ''.obs;
  RxString country = ''.obs;

  RxBool isLoading = true.obs;

  // TextEditingControllers
  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController targetLineController;
  late TextEditingController websiteController;
  late TextEditingController addressController;
  late TextEditingController countryController;

  @override
  void onInit() {
    super.onInit();
    // Initialize controllers
    nameController = TextEditingController();
    phoneController = TextEditingController();
    targetLineController = TextEditingController();
    websiteController = TextEditingController();
    addressController = TextEditingController();
    countryController = TextEditingController();

    // Synchronize controllers with Rx values
    _setupListeners();

    // Load initial data
    loadProfileData();
    print("Init Completed...");
  }

  @override
  void onClose() {
    // Dispose controllers
    nameController.dispose();
    phoneController.dispose();
    targetLineController.dispose();
    websiteController.dispose();
    addressController.dispose();
    countryController.dispose();
    super.onClose();
  }

  // Synchronize TextEditingControllers with RxString values
  void _setupListeners() {
    nameController.addListener(() => name.value = nameController.text);
    phoneController.addListener(() => phone.value = phoneController.text);
    targetLineController
        .addListener(() => targetLine.value = targetLineController.text);
    websiteController.addListener(() => website.value = websiteController.text);
    addressController.addListener(() => address.value = addressController.text);
    countryController.addListener(() => country.value = countryController.text);
  }

  // Load profile data from Firebase
  Future<void> loadProfileData() async {
    print("Loading profile data...");
    try {
      final String? userId = _auth.currentUser?.uid;

      if (userId != null) {
        // Reference to the user's document
        final DocumentReference userDoc =
            FirebaseFirestore.instance.collection('users').doc(userId);

        // Fetch the document
        final DocumentSnapshot docSnapshot = await userDoc.get();

        // Check if the document exists
        if (docSnapshot.exists) {
          // Convert the document to a map
          final data = docSnapshot.data() as Map<String, dynamic>;

          print("Retrieved profile data: $data");

          // Update observable variables
          name.value = data['name'] ?? '';
          targetLine.value = data['targetLine'] ?? '';
          phone.value = data['phone'] ?? '';
          website.value = data['website'] ?? '';
          address.value = data['address'] ?? '';
          country.value = data['country'] ?? '';

          // Update text controllers
          nameController.text = name.value;
          targetLineController.text = targetLine.value;
          phoneController.text = phone.value;
          websiteController.text = website.value;
          addressController.text = address.value;
          countryController.text = country.value;
        } else {
          print("No profile data found for user $userId.");
        }
      } else {
        print("No authenticated user found.");
      }
    } catch (e) {
      print("Error loading profile data: $e");
      Get.snackbar('Error', 'Failed to load profile data: $e',
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }

  // Save profile data to Firebase
  Future<void> saveProfileData() async {
    print("SAVING PROFILE/...");
    try {
      String? logoUrl;
      // if (logoFilePath.isNotEmpty) {
      //   logoUrl = await uploadLogo(logoFilePath.value);
      // }

      final String? userId = _auth.currentUser?.uid;
      final CollectionReference usersCollection =
          FirebaseFirestore.instance.collection('users');

      await usersCollection.doc(userId).set({
        'name': name.value,
        'targetLine': targetLine.value,
        'phone': phone.value,
        'website': website.value,
        'address': address.value,
        'country': country.value,
        'logoPath': logoUrl ?? '',
        'updatedAt': FieldValue.serverTimestamp(),
      });
      print(usersCollection);

      Get.snackbar('Success', 'Profile saved successfully!',
          backgroundColor: Colors.green, colorText: Colors.white);
    } catch (e) {
      Get.snackbar('Error', 'Failed to save profile: $e',
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }
}
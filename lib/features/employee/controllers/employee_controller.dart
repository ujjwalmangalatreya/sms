import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmployeeController extends GetxController {
  // Observable variables
  RxString employeeName = ''.obs;
  RxString mobileNumber = ''.obs;
  RxString employeeRole = ''.obs;
  RxString dateOfJoining = ''.obs;
  RxString monthlySalary = ''.obs;
  RxString fatherHusbandName = ''.obs;
  RxString gender = ''.obs;
  RxString nationalId = ''.obs;
  RxString emailAddress = ''.obs;
  RxString education = ''.obs;
  RxString homeAddress = ''.obs;
  RxString choosePicture = ''.obs;

  RxBool isLoading = true.obs;

  // TextEditingControllers
  late TextEditingController employeeNameController;
  late TextEditingController mobileNumberController;
  late TextEditingController employeeRoleController;
  late TextEditingController dateOfJoiningController;
  late TextEditingController monthlySalaryController;
  late TextEditingController fatherHusbandNameController;
  late TextEditingController genderController;
  late TextEditingController nationalIdController;
  late TextEditingController emailAddressController;
  late TextEditingController educationController;
  late TextEditingController homeAddressController;
  late TextEditingController choosePictureController;

  @override
  void onInit() {
    super.onInit();

    // Initialize controllers
    employeeNameController = TextEditingController();
    mobileNumberController = TextEditingController();
    employeeRoleController = TextEditingController();
    dateOfJoiningController = TextEditingController();
    monthlySalaryController = TextEditingController();
    fatherHusbandNameController = TextEditingController();
    genderController = TextEditingController();
    nationalIdController = TextEditingController();
    emailAddressController = TextEditingController();
    educationController = TextEditingController();
    homeAddressController = TextEditingController();
    choosePictureController = TextEditingController();

    // Set up listeners for text controllers
    _setupListeners();
  }

  @override
  void onClose() {
    // Dispose controllers
    employeeNameController.dispose();
    mobileNumberController.dispose();
    employeeRoleController.dispose();
    dateOfJoiningController.dispose();
    monthlySalaryController.dispose();
    fatherHusbandNameController.dispose();
    genderController.dispose();
    nationalIdController.dispose();
    emailAddressController.dispose();
    educationController.dispose();
    homeAddressController.dispose();
    choosePictureController.dispose();

    super.onClose();
  }

  void clearAllFields() {
    // Clear text controllers
    employeeNameController.clear();
    mobileNumberController.clear();
    employeeRoleController.clear();
    dateOfJoiningController.clear();
    monthlySalaryController.clear();
    fatherHusbandNameController.clear();
    genderController.clear();
    nationalIdController.clear();
    emailAddressController.clear();
    educationController.clear();
    homeAddressController.clear();
    choosePictureController.clear();
  }

  void _setupListeners() {
    // Attach listeners to update observable variables
    employeeNameController
        .addListener(() => employeeName.value = employeeNameController.text);
    mobileNumberController
        .addListener(() => mobileNumber.value = mobileNumberController.text);
    employeeRoleController
        .addListener(() => employeeRole.value = employeeRoleController.text);
    dateOfJoiningController
        .addListener(() => dateOfJoining.value = dateOfJoiningController.text);
    monthlySalaryController
        .addListener(() => monthlySalary.value = monthlySalaryController.text);
    fatherHusbandNameController.addListener(
        () => fatherHusbandName.value = fatherHusbandNameController.text);
    genderController.addListener(() => gender.value = genderController.text);
    nationalIdController
        .addListener(() => nationalId.value = nationalIdController.text);
    emailAddressController
        .addListener(() => emailAddress.value = emailAddressController.text);
    educationController
        .addListener(() => education.value = educationController.text);
    homeAddressController
        .addListener(() => homeAddress.value = homeAddressController.text);
    choosePictureController
        .addListener(() => choosePicture.value = choosePictureController.text);
  }

  Future<void> saveEmployeeData() async {
    try {
      isLoading.value = true;

      // Reference Firestore collection
      final CollectionReference employeesCollection =
          FirebaseFirestore.instance.collection('employees');

      // Add document to Firestore
      await employeesCollection.add({
        'employeeName': employeeName.value,
        'mobileNumber': mobileNumber.value,
        'employeeRole': employeeRole.value,
        'dateOfJoining': dateOfJoining.value,
        'monthlySalary': monthlySalary.value,
        'fatherHusbandName': fatherHusbandName.value,
        'gender': gender.value,
        'nationalId': nationalId.value,
        'emailAddress': emailAddress.value,
        'education': education.value,
        'homeAddress': homeAddress.value,
        'choosePicture': choosePicture.value,
        'createdAt': FieldValue.serverTimestamp(),
        'updatedAt': FieldValue.serverTimestamp(),
      });

      Get.snackbar('Success', 'Employee profile saved successfully!',
          backgroundColor: Colors.green, colorText: Colors.white);
    } catch (e) {
      // Show error message
      Get.snackbar('Error', 'Failed to save profile: $e',
          backgroundColor: Colors.red, colorText: Colors.white);
    } finally {
      isLoading.value = false;
    }
  }
}

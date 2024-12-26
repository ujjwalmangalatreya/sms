import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmployeeController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
  late TextEditingController choosePictireController;

  @override
  void onInit() {
    super.onInit();
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
    choosePictireController = TextEditingController();

    _setupListners();

//TODO : Will do it later
    //loadEmployeedata();
  }

  @override
  void onClose() {
    super.onClose();
    homeAddressController.dispose();
    educationController.dispose();
    emailAddressController.dispose();
    nationalIdController.dispose();
    genderController.dispose();
    fatherHusbandNameController.dispose();
    monthlySalaryController.dispose();
    dateOfJoiningController.dispose();
    employeeNameController.dispose();
    employeeRoleController.dispose();
    mobileNumberController.dispose();
    choosePictireController.dispose();
  }

  void _setupListners() {
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
        choosePictireController
         .addListener(() => choosePicture.value = choosePictireController.text);
  }

  Future<void> saveEmployeeData() async {
    try {
      isLoading.value = true;

      final CollectionReference employeesCollection =
          FirebaseFirestore.instance.collection('employees');

      await employeesCollection.doc().set({
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
        'updatedAt': FieldValue.serverTimestamp(),
      });

      Get.snackbar('Success', 'Employee profile saved successfully!',
          backgroundColor: Colors.green, colorText: Colors.white);
    } catch (e) {
      Get.snackbar('Error', 'Failed to save profile: $e',
          backgroundColor: Colors.red, colorText: Colors.white);
    } finally {
      isLoading.value = false;
    }
  }
}

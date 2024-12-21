import 'package:get/get.dart';

class ProfileController extends GetxController {
  final name = ''.obs;
  final phone = ''.obs;
  final website = ''.obs;
  final address = ''.obs;
  final targetLine = ''.obs;
  final selectedCountry = 'India'.obs;

  void updateProfile() {
    // Add your update logic here
    print('Profile Updated');
  }
}

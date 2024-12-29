import 'package:get/get.dart';
import 'package:schoolmgmt/features/employee/controllers/employee_controller.dart';

class EmployeeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(EmployeeController());
  }
}

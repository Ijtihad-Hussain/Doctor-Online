import 'package:get/get.dart';

import '../../screens/user_side/lab_test_screen.dart';

class DiagnosticTestsController extends GetxController {
  void navigateToLabTestsScreen() {
    Get.to(() => LabTestsScreen());
  }
}

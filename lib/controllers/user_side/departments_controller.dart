import 'package:get/get.dart';

import '../../screens/user_side/doctor_related/departments/cardioloists.dart';
import '../../screens/user_side/doctor_related/departments/dentists.dart';
import '../../screens/user_side/doctor_related/departments/dermatologists.dart';
import '../../screens/user_side/doctor_related/departments/eye_specialists.dart';
import '../../screens/user_side/doctor_related/departments/gastroenterologists.dart';
import '../../screens/user_side/doctor_related/departments/pediatricians.dart';

class DepartmentsController extends GetxController {
  void navigateToSpecialty(String specialty) {
    switch (specialty) {
      case 'Cardiologists':
        Get.to(() => Cardiologists());
        break;
      case 'Dentists':
        Get.to(() => Dentists());
        break;
      case 'Pediatricians':
        Get.to(() => Pediatricians());
        break;
      case 'Dermatologists':
        Get.to(() => Dermatologists());
        break;
      case 'Gastroenterologists':
        Get.to(() => Gastroenterologists());
        break;
      case 'EyeSpecialists':
        Get.to(() => EyeSpecialists());
        break;
      default:
        break;
    }
  }
}

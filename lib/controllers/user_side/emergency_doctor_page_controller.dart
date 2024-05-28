import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EmergencyDoctorController extends GetxController {
  final onlineDoctors = <QueryDocumentSnapshot>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchOnlineDoctors();
  }

  void fetchOnlineDoctors() {
    FirebaseFirestore.instance
        .collection('doctors')
        .where('status', isEqualTo: 'online')
        .snapshots()
        .listen((snapshot) {
      onlineDoctors.value = snapshot.docs;
    });
  }

  void initiateCall(String doctorId) {
    // Add your logic to initiate a call
  }
}

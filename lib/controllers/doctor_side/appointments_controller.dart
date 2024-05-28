import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AppointmentsController extends GetxController {
  var appointments = <DocumentSnapshot>[].obs;
  var isLoading = true.obs;

  final currentUser = FirebaseAuth.instance.currentUser;

  @override
  void onInit() {
    super.onInit();
    fetchAppointments();
  }

  void fetchAppointments() {
    if (currentUser == null) {
      isLoading.value = false;
      return;
    }

    FirebaseFirestore.instance
        .collection('appointments')
        .where('doctorEmail', isEqualTo: currentUser!.email)
        .snapshots()
        .listen((snapshot) {
      appointments.value = snapshot.docs;
      isLoading.value = false;
    });
  }
}

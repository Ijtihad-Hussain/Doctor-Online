import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DoctorHomeController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  var isOnline = false.obs;
  var upcomingAppointments = <Appointment>[].obs;
  var isLoadingAppointments = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchDoctorStatus();
    fetchUpcomingAppointments();
  }

  void fetchDoctorStatus() async {
    final currentUser = _auth.currentUser;
    if (currentUser != null) {
      final userId = currentUser.uid;
      final userDoc = firestore.collection('doctors').doc(userId);
      final userSnapshot = await userDoc.get();
      final status = userSnapshot.data()?['status'];
      isOnline.value = status == 'online';
    }
  }

  void toggleStatus() async {
    final currentUser = _auth.currentUser;
    if (currentUser != null) {
      final email = currentUser.email;
      final newStatus = isOnline.value ? 'offline' : 'online';
      final userDoc = firestore.collection('doctors').where('email', isEqualTo: email);
      final querySnapshot = await userDoc.get();
      if (querySnapshot.docs.isNotEmpty) {
        final doctorDoc = querySnapshot.docs.first.reference;
        await doctorDoc.update({'status': newStatus});
        isOnline.value = !isOnline.value;
      }
    }
  }

  void fetchUpcomingAppointments() async {
    try {
      var now = DateTime.now();
      var querySnapshot = await firestore
          .collection('appointments')
          .where('doctorEmail', isEqualTo: _auth.currentUser?.email)
          .where('date', isGreaterThan: now)
          .orderBy('date')
          .limit(4)
          .get();

      List<Appointment> appointments = [];
      for (var documentSnapshot in querySnapshot.docs) {
        var data = documentSnapshot.data();
        var name = data['name'];
        var date = data['date'].toDate();
        var day = date.day;
        appointments.add(Appointment(name: name, date: date, day: day));
      }

      upcomingAppointments.value = appointments;
    } catch (e) {
      if (kDebugMode) {
        print('Error fetching appointments: $e');
      }
    } finally {
      isLoadingAppointments.value = false;
    }
  }
}

class Appointment {
  String name;
  DateTime date;
  int day;

  Appointment({required this.name, required this.date, required this.day});
}
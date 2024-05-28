
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../controllers/doctor_side/appointments_controller.dart';

class Appointments extends StatelessWidget {
  final AppointmentsController appointmentsController = Get.put(AppointmentsController());

  Appointments({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appointments'),
      ),
      body: Obx(() {
        if (appointmentsController.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (appointmentsController.appointments.isEmpty) {
          return const Center(child: Text('No appointments found.'));
        }

        return ListView.builder(
          itemCount: appointmentsController.appointments.length,
          itemBuilder: (BuildContext context, int index) {
            DocumentSnapshot appointment = appointmentsController.appointments[index];
            String name = appointment['name'];
            String date = appointment['selectedDate'];
            return Card(
              child: ListTile(
                leading: CircleAvatar(
                  child: Text(
                    name.isNotEmpty ? name[0] : '',
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                title: Text(name),
                subtitle: Text(date.toString()),
                onTap: () {
                  // Navigate to appointment details page
                },
              ),
            );
          },
        );
      }),
    );
  }
}
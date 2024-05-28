import 'package:flutter/material.dart';
import 'package:tele_consult/widgets/button.dart';

import 'package:get/get.dart';

import '../../controllers/user_side/emergency_doctor_page_controller.dart';
import 'User/payment_page.dart';

class EmergencyDoctorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final EmergencyDoctorController controller = Get.put(EmergencyDoctorController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Online Doctors'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Our online doctors are available for emergency calls 24/7. Please select a doctor to start the call:',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 16.0),
              Obx(() {
                if (controller.onlineDoctors.isEmpty) {
                  return Center(child: CircularProgressIndicator());
                }
                return Column(
                  children: controller.onlineDoctors.map((document) {
                    final doctorData = document.data() as Map<String, dynamic>;
                    return DoctorCardEmergency(
                      name: doctorData['name'],
                      specialty: doctorData['speciality'],
                      imageUrl: doctorData['imageUrl'],
                      onTap: () {
                        controller.initiateCall(document.id);
                      },
                    );
                  }).toList(),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}


class DoctorCardEmergency extends StatelessWidget {
  final String? name;
  final String? specialty;
  final String? imageUrl;
  final VoidCallback? onTap;

  const DoctorCardEmergency({
    Key? key,
    this.name,
    this.specialty,
    this.imageUrl,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 30.0,
                backgroundImage: NetworkImage(imageUrl!),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name!,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(specialty!),
                  ],
                ),
              ),
            ),
            Button(
              buttonText: 'Call Now',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PaymentPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}


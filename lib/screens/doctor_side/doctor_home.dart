import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controllers/doctor_side/doctor_home_controller.dart';
import '../../utils/colors.dart';
import '../../utils/custom_tex_styles.dart';
import '../../widgets/apointments_box.dart';
import '../../widgets/button.dart';
import '../../widgets/patient_card.dart';
import '../user_side/chat/group_calling_screen.dart';
import 'appointments.dart';
import 'doctor_menu.dart';

class DoctorHome extends StatelessWidget {
  const DoctorHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DoctorHomeController controller = Get.put(DoctorHomeController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kGBlue,
        title: const Center(child: Text('Welcome Doctor')),
        actions: <Widget>[
          Obx(() {
            return IconButton(
              onPressed: controller.toggleStatus,
              icon: Icon(controller.isOnline.value ? Icons.visibility : Icons.visibility_off),
            );
          }),
        ],
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const DoctorMenu()),
            );
          },
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Wrap(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Appointments()),
                        );
                      },
                      child: AppointmentsBox(
                        color: kGBlue,
                        icon: Icon(Icons.medication),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => GroupCallScreen()),
                        );
                      },
                      child: AppointmentsBox(
                        color: kGBlue,
                        icon: Icon(Icons.chat),
                        text: 'Online Consultations',
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Upcoming Appointments',
                  style: CustomTextStyles.boldStyle.copyWith(fontSize: 16),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.h),
              ),
              Obx(() {
                if (controller.isLoadingAppointments.value) {
                  return Center(child: CircularProgressIndicator());
                }
                if (controller.upcomingAppointments.isEmpty) {
                  return Center(child: Text('No upcoming appointments.'));
                }
                return Column(
                  children: [
                    for (var appointment in controller.upcomingAppointments)
                      PatientCard(name: appointment.name, day: appointment.day),
                  ],
                );
              }),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Button(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Appointments(),
                      ),
                    );
                  },
                  buttonText: 'View All',
                  width: 200,
                  color: kGBlue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

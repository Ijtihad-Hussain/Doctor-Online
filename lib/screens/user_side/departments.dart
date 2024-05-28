import 'package:flutter/material.dart';
import 'package:tele_consult/widgets/department_card.dart';
import 'package:get/get.dart';

import '../../controllers/user_side/departments_controller.dart';

class Departments extends StatelessWidget {
  final DepartmentsController controller = Get.put(DepartmentsController());

  Departments({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(color: Colors.white70),
        padding: const EdgeInsets.only(top: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 18,),
              Text('Select Department', style: TextStyle(fontSize: 20),),
              const SizedBox(
                height: 28,
              ),
              _buildDepartmentCard(
                name: 'Cardiologists',
                belowText: '3  Doctors available',
              ),
              const SizedBox(
                height: 14,
              ),
              _buildDepartmentCard(
                name: 'Dentists',
                belowText: '3 Doctors available',
                icon: Image.asset('assets/images/tooth.png'),
              ),
              const SizedBox(
                height: 14,
              ),
              _buildDepartmentCard(
                name: 'Pediatricians',
                belowText: '3 Doctors available',
                icon: Image.asset('assets/images/pediatrician.png'),
              ),
              const SizedBox(
                height: 14,
              ),
              _buildDepartmentCard(
                name: 'Dermatologists',
                belowText: '3 Doctors available',
                icon: Image.asset('assets/images/dermatologist.png'),
              ),
              const SizedBox(
                height: 14,
              ),
              _buildDepartmentCard(
                name: 'Gastroenterologists',
                belowText: '3 Doctors available',
                icon: Image.asset('assets/images/Gastroenterologist.png'),
              ),
              const SizedBox(
                height: 14,
              ),
              _buildDepartmentCard(
                name: 'EyeSpecialists',
                belowText: '3 Doctors available',
                icon: Image.asset('assets/images/eye-specialist.png'),
              ),
              const SizedBox(
                height: 14,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDepartmentCard({required String name, required String belowText, Image? icon}) {
    return GestureDetector(
      onTap: () {
        controller.navigateToSpecialty(name);
      },
      child: DepartmentCard(
        name: name,
        belowText: belowText,
        icon: icon,
      ),
    );
  }
}


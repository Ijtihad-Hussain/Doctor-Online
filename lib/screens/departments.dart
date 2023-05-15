import 'package:flutter/material.dart';
import 'package:tele_consult/screens/aboutDoctor/departments/cardioloists.dart';
import 'package:tele_consult/screens/aboutDoctor/departments/dentists.dart';
import 'package:tele_consult/screens/aboutDoctor/departments/dermatologists.dart';
import 'package:tele_consult/screens/aboutDoctor/departments/eyeSpecialists.dart';
import 'package:tele_consult/screens/aboutDoctor/departments/gastroenterologists.dart';
import 'package:tele_consult/screens/aboutDoctor/departments/pediatricians.dart';
import 'package:tele_consult/widgets/departmentCard.dart';

import '../widgets/customTextFormField.dart';
import 'aboutDoctor/findDoctors.dart';

class Departments extends StatelessWidget {
  const Departments({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: Colors.white70),
        padding: const EdgeInsets.only(top: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 18,),
              Text('Select Department', style: TextStyle(fontSize: 20),),
              const SizedBox(
                height: 28,
              ),
              GestureDetector(
                child: DepartmentCard(
                  belowText: '3  Doctors available',
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Cardiologists()),
                  );
                },
              ),
              const SizedBox(
                height: 14,
              ),
              GestureDetector(
                child: DepartmentCard(
                  name: 'Dentist',
                  belowText: '3 Doctors available',
                  icon: Image.asset('assets/images/tooth.png'),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Dentists()),
                  );
                },
              ),
              const SizedBox(
                height: 14,
              ),
              GestureDetector(
                child: DepartmentCard(
                  name: 'Pediatrician',
                  icon: Image.asset('assets/images/pediatrician.png'),
                  belowText: '3 Doctors available',
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Pediatricians()),
                  );
                },
              ),
              const SizedBox(
                height: 14,
              ),
              GestureDetector(
                child: DepartmentCard(
                  name: 'Dermatologist',
                  belowText: '3 Doctors available',
                  icon: Image.asset('assets/images/dermatologist.png'),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Dermatologists()),
                  );
                },
              ),
              const SizedBox(
                height: 14,
              ),
              GestureDetector(
                child: DepartmentCard(
                  name: 'Gastroenterologist',
                  belowText: '3 Doctors available',
                  icon: Image.asset('assets/images/Gastroenterologist.png'),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Gastroenterologists()),
                  );
                },
              ),
              const SizedBox(
                height: 14,
              ),
              GestureDetector(
                child: DepartmentCard(
                  name: 'Eye Specialist',
                  belowText: '3 Doctors available',
                  icon: Image.asset('assets/images/eye-specialist.png'),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => EyeSpecialists()),
                  );
                },
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
}

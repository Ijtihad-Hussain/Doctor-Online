import 'package:flutter/material.dart';

import '../../../models/doctor.dart';
import '../../../widgets/button.dart';
import '../../../widgets/customTextFormField.dart';
import '../../../widgets/doctorBookCard.dart';
import '../../../widgets/doctorCard.dart';
import '../../../widgets/pageDecoration.dart';
import '../appointmentNext.dart';
import '../doctorDetails.dart';

class Cardiologists extends StatefulWidget {
  const Cardiologists({Key? key}) : super(key: key);

  @override
  State<Cardiologists> createState() => _CardiologistsState();
}

class _CardiologistsState extends State<Cardiologists> {
  final TextEditingController _searchController = TextEditingController();

  List<Doctor> _doctors = [
    Doctor(
      name: 'Dr Ahmed Faraz',
      speciality: 'Cardiologist',
      experience: '7 years experience',
      availability: '12:00 PM tomorrow',
      image: Image.asset(
        'assets/images/ly1.png',
        width: 80,
      ),
    ),
    Doctor(
      name: 'Dr Irshad Hussain',
      speciality: 'Cardiologist',
      experience: '10 years experience',
      availability: '12:00 PM tomorrow',
      image: Image.asset(
        'assets/images/ly1.png',
        width: 80,
      ),
    ),
    Doctor(
      name: 'Dr Salman Ali',
      speciality: 'Cardiologist',
      experience: '12 years experience',
      availability: '12:00 PM tomorrow',
      image: Image.asset(
        'assets/images/gy1.png',
        width: 80,
      ),
    ),
  ];

  List<Doctor> _searchDoctors(String query) {
    return _doctors.where((doctor) {
      final nameLower = doctor.name.toLowerCase();
      final queryLower = query.toLowerCase();
      return nameLower.contains(queryLower);
    }).toList();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: PageDecoration.pageDecoration,
        padding: const EdgeInsets.only(top: 40),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextFormField(
                hintText: 'Search Doctor',
                height: 44,
                keyBoardType: TextInputType.text,
                controller: _searchController,
                onChanged: (value) {
                  setState(() {
                    _doctors = _searchDoctors(value);
                  });
                },
              ),
              const SizedBox(
                height: 18,
              ),
              // Map the filtered doctors list to DoctorBookCard widgets
              ..._doctors.map(
                    (doctor) => GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DoctorDetails()),
                    );
                  },
                  child: DoctorCart(
                    name: doctor.name,
                    specialization: doctor.speciality,
                    experience: doctor.experience!,
                    image: AssetImage('assets/images/doctorm.jpg'),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


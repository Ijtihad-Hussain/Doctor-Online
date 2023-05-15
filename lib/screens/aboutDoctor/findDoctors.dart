import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:tele_consult/screens/aboutDoctor/doctorDetails.dart';
import 'package:tele_consult/screens/aboutDoctor/selectDoctorTime.dart';
import 'package:tele_consult/widgets/customTextFormField.dart';
import 'package:tele_consult/widgets/doctorBookCard.dart';
import 'package:tele_consult/widgets/pageDecoration.dart';

import '../../models/doctor.dart';
import '../../widgets/button.dart';
import '../auth/sign_in.dart';
import 'appointmentNext.dart';

class FindDoctors extends StatefulWidget {
  const FindDoctors({Key? key}) : super(key: key);

  @override
  State<FindDoctors> createState() => _FindDoctorsState();
}

class _FindDoctorsState extends State<FindDoctors> {
  final TextEditingController _searchController = TextEditingController();
  String? selectedGender;

  Widget buildGenderDropdown() {
    return DropdownButtonFormField<String>(
      value: selectedGender,
      decoration: InputDecoration(
        hintText: 'Gender',
        hintStyle: TextStyle(color: Colors.grey),
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      onChanged: (value) {
        setState(() {
          selectedGender = value;
        });
      },
      items: ['Male', 'Female', 'Other']
          .map((gender) => DropdownMenuItem<String>(
        value: gender,
        child: Text(gender),
      ))
          .toList(),
    );
  }

  List<Doctor> _doctors = [
    Doctor(
      name: 'Abdur Rehman',
      speciality: 'Cardiologist',
      experience: '7 years experience',
      availability: '12:00 PM tomorrow',
      image: Image.asset(
        'assets/images/ly1.png',
        width: 80,
      ),
    ),
    Doctor(
      name: 'Victoria Kane',
      speciality: 'Cardiologist',
      experience: '10 years experience',
      availability: '12:00 PM tomorrow',
      image: Image.asset(
        'assets/images/ly1.png',
        width: 80,
      ),
    ),
    Doctor(
      name: 'Salman Ali',
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
                    // Filter the doctors list based on the entered text
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
                  child: DoctorBookCard(
                    name: doctor.name,
                    specialization: doctor.speciality,
                    experience: doctor.experience,
                    availability: doctor.availability,
                    doctorpicture: doctor.image ??
                        Image.asset(
                          'assets/images/doctor.png',
                          width: 80,
                        ),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            _patientDetailsDialog(context),
                      );
                    },
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

Widget _patientDetailsDialog(BuildContext context) {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();

  return AlertDialog(
    title: const Text('Enter Details'),
    content: Container(
      height: 320,
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 8),
              child: Text(
                'Patient Name',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            CustomTextFormField(
              width: 220,
              height: 40,
              hintText: 'Name',
              color: Colors.grey,
              isTextAlignCenter: true,
              controller: nameController,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 12),
              child: Text(
                'Patient Age',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            CustomTextFormField(
              width: 220,
              height: 40,
              hintText: 'Age',
              color: Colors.grey,
              isTextAlignCenter: true,
              controller: ageController,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 12),
              child: Text(
                'Patient Gender',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),

            CustomTextFormField(
              width: 220,
              height: 40,
              hintText: 'Gender',
              color: Colors.grey,
              isTextAlignCenter: true,
              controller: genderController,
            ),
            const Padding(
              padding: EdgeInsets.only(top: 12),
              child: Text(
                'Mobile Number',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            CustomTextFormField(
              width: 220,
              height: 40,
              hintText: '+17281787237',
              color: Colors.grey,
              isTextAlignCenter: true,
              controller: mobileNumberController,
            ),
          ],
        ),
      ),
    ),
    actions: <Widget>[
      Button(
        buttonText: 'Book',
        onPressed: () {
          String name = nameController.text;
          int age = int.tryParse(ageController.text) ?? 0;
          String gender = genderController.text;
          String mobileNumber = mobileNumberController.text;

          // final CollectionReference appointmentsCollection =
          // FirebaseFirestore.instance.collection('appointments');
          //
          // appointmentsCollection
          //     .add({
          //   'name': name,
          //   'age': age,
          //   'gender': gender,
          //   'mobileNumber': mobileNumber,
          // })
          //     .then((value) => print('Appointment added'))
          //     .catchError((error) =>
          //     print('Failed to add appointment: $error'));
          //
          // // Clear the text controllers after navigation
          // nameController.clear();
          // ageController.clear();
          // genderController.clear();
          // mobileNumberController.clear();
          //
          // Navigator.push(
          //     // context,
          // //     MaterialPageRoute(builder: (context) => AppointmentNext(
          // //   name: name,
          // //   age: age,
          // //   gender: gender,
          // //   mobileNumber: mobileNumber,
          // // )),
          // );
        },
      ),
    ],
  );
}

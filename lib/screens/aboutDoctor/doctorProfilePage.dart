import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/button.dart';
import '../../widgets/customTextFormField.dart';
import 'appointmentNext.dart';

String? DoctorName;
String? doctorEmail;

class DoctorProfilePage extends StatefulWidget {
  final String doctorName;
  final String specialization;
  final String experience;
  final String about;
  final String email;
  final ImageProvider<Object> image;

  const DoctorProfilePage({
    Key? key,
    required this.doctorName,
    required this.specialization,
    required this.experience,
    required this.about,
    required this.email,
    required this.image,
  }) : super(key: key);

  @override
  State<DoctorProfilePage> createState() => _DoctorProfilePageState();
}

class _DoctorProfilePageState extends State<DoctorProfilePage> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DoctorName = widget.doctorName;
    doctorEmail = widget.email;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Doctor's Profile"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 320.h,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: widget.image,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Button(
                        buttonText: 'Book Appointment',
                        width: 125,
                        fontSize: 10,
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                _patientDetailsDialog(context),
                          );
                        },
                      ),
                      SizedBox(width: 16.w),
                      Button(
                        buttonText: 'Video Consultation',
                        width: 125,
                        fontSize: 10,
                        color: Colors.redAccent,
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                _patientDetailsDialog(context),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.doctorName,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.specialization,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 20,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        '${widget.experience}',
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'About',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.about ??
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus efficitur nisi quam, eu sollicitudin enim dictum in. Pellentesque ac congue justo. Etiam porta, mi ut dignissim pretium, magna metus interdum magna, eu bibendum ex mauris non nulla. Praesent consectetur ac lacus quis blandit. Morbi bibendum efficitur tellus, vel suscipit lorem facilisis ut. In laoreet urna vel sapien faucibus, quis finibus quam accumsan. Sed quis urna sagittis, gravida urna et, vehicula velit. Vestibulum nec metus at sapien congue sagittis id quis ipsum. Proin in neque vitae urna hendrerit faucibus. Duis fringilla turpis at purus sollicitudin, vel sagittis mi vestibulum. Nulla sollicitudin arcu libero, a consequat tellus egestas vel.',
                    style: TextStyle(
                      fontSize: 16,
                      height: 1.5,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
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
    title: Text(
      'Patient Details',
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
    content: Container(
      height: 320.h,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            TextFormField(
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey,
                hintText: 'Name',
              ),
              style: TextStyle(fontSize: 16),
              controller: nameController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
            SizedBox(height: 12),
            Text(
              'Age',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Container(
              width: 220,
              height: 40,
              child: TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey,
                  hintText: 'Age',
                ),
                style: TextStyle(fontSize: 16),
                controller: ageController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your age';
                  }
                  int? age = int.tryParse(value);
                  if (age == null || age <= 0) {
                    return 'Invalid age';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 12),
            Text(
              'Gender',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Container(
              width: 220,
              height: 40,
              child: DropdownButtonFormField<String>(
                value: genderController.text.isEmpty ? null : genderController.text,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey,
                  hintText: 'Select Gender',
                ),
                items: [
                  DropdownMenuItem<String>(
                    value: 'Male',
                    child: Text('Male'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'Female',
                    child: Text('Female'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'Other',
                    child: Text('Other'),
                  ),
                ],
                onChanged: (value) {
                  genderController.text = value!;
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select your gender';
                  }
                  return null;
                },
              ),
            ),
            SizedBox(height: 12),
            Text(
              'Mobile Number',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Container(
              width: 220,
              height: 40,
              child: TextFormField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey,
                  hintText: '+17281787237',
                ),
                controller: mobileNumberController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your mobile number';
                  }
                  return null;
                },
              ),
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

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AppointmentNext(
                name: name,
                age: age,
                gender: gender,
                mobileNumber: mobileNumber,
                doctorName: DoctorName!,
                doctorEmail: doctorEmail!,
              ),
            ),
          );
        },
      ),
    ],
  );
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../widgets/button.dart';
import '../../widgets/customTextFormField.dart';
import 'appointmentNext.dart';

class DoctorProfilePage extends StatelessWidget {
  final String doctorName;
  final String specialization;
  final String experience;
  final ImageProvider<Object> image;

  const DoctorProfilePage({
    Key? key,
    required this.doctorName,
    required this.specialization,
    required this.experience,
    required this.image,
  }) : super(key: key);

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
                  image: image,
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
                    doctorName,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    specialization,
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
                        '${experience}',
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
                  const Text(
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
    title: const Text('Enter Details'),
    content: Container(
      height: 320.h,
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

          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AppointmentNext(
              name: name,
              age: age,
              gender: gender,
              mobileNumber: mobileNumber,
              doctorName: name
            )),
          );
        },
      ),
    ],
  );
}
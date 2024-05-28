import 'package:flutter/material.dart';
import 'package:tele_consult/screens/user_side/patient_details.dart';

import '../../widgets/button.dart';
import '../../widgets/custom_text_form_field.dart';
import '../aboutDoctor/appointment_next.dart';

class LabTestsScreen extends StatelessWidget {
  const LabTestsScreen({Key? key}) : super(key: key);

  static const List<String> _testNames = [
    'Complete Blood Count (CBC)',
    'Blood Sugar Test (Fasting & Random)',
    'Lipid Profile',
    'Liver Function Test (LFT)',
    'Kidney Function Test (KFT)',
    'Thyroid Profile (T3, T4, TSH)',
    'Hepatitis B & C Screening',
    'HIV Screening Test',
    'Urine Test (Routine)',
    'Stool Test (Routine)',
    'Pregnancy Test (Urine)',
    'Blood Grouping and Rh Typing',
    'X-Ray',
    'Ultrasound (Abdomen)',
    'Electrocardiogram (ECG)',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lab Tests'),
      ),
      body: ListView.builder(
        itemCount: _testNames.length,
        itemBuilder: (context, index) {
          final testName = _testNames[index];
          return ListTile(
            title: Text(testName),
            trailing: ElevatedButton(
              onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => _patientDetailsDialog(context)),
                  );
              },
              child: const Text('Book Now'),
            ),
          );
        },
      ),
    );
  }
}

Widget _patientDetailsDialog(BuildContext context) {
  return AlertDialog(
    title: const Text('Enter Details'),
    content: Container(
      height: 320,
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
          ),
        ],
      ),
    ),
    actions: <Widget>[
      Button(
        buttonText: 'Book',
        onPressed: () {

        },
      ),
    ],
  );
}
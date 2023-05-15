import 'package:flutter/material.dart';
import 'package:tele_consult/screens/aboutDoctor/appointmentNext.dart';
import 'package:tele_consult/widgets/button.dart';
import 'package:tele_consult/widgets/customTextFormField.dart';
import 'package:tele_consult/widgets/doctorCardHorizontal.dart';

import '../../utils/colors.dart';
import '../../utils/customTextStyles.dart';
import '../../widgets/doctorBookCard.dart';
import '../../widgets/pageDecoration.dart';

class Appointment extends StatelessWidget {
  const Appointment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.black38,
        ),
        title: const Padding(
          padding: EdgeInsets.only(top: 40, left: 20),
          child: Text(
            'Appointment',
            style: TextStyle(
                color: Colors.black38,
                fontWeight: FontWeight.bold,
                fontSize: 24),
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: PageDecoration.pageDecoration,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 120),
        child: SingleChildScrollView(
          child: Column(
            children: [
              DoctorCardHorizontal(
                belowName: 'Cardiologist',
              ),
              const Padding(
                padding: EdgeInsets.only(top: 32, bottom: 18, right: 80),
                child: Text(
                  'Appointment For',
                  style: TextStyle(fontSize: 24),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextFormField(
                  hintText: 'Patient Name',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextFormField(
                  hintText: 'Contact',
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Button(
                  onPressed: (){

                  },
                  // onPressed: () {
                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(builder: (context) => AppointmentNext()),
                  //   );
                  // },
                  buttonText: 'Next',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

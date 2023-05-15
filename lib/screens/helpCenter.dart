import 'package:flutter/material.dart';
import 'package:tele_consult/widgets/boxContainer.dart';

import '../widgets/customTextFormField.dart';
import '../widgets/pageDecoration.dart';

class HelpCenter extends StatelessWidget {
  const HelpCenter({Key? key}) : super(key: key);

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
        title: const Text(
          'Help Center',
          style: TextStyle(color: Colors.black38),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: PageDecoration.pageDecoration,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomTextFormField(
                  height: 60,
                  width: 350,
                  hintText: 'I have an issue with',
                  isTextAlignCenter: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:2,right: 60),
                child: BoxContainer(
                  width: 440,
                  text: 'Booking a new Appointment',
                backgroundColor: Colors.transparent,
                  textColor: Colors.black54,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:2,right: 60),
                child: BoxContainer(
                  width: 440,
                  text: 'Existing Appointment',
                  backgroundColor: Colors.transparent,
                  textColor: Colors.black54,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:2,right: 60),
                child: BoxContainer(
                  width: 440,
                  text: 'Online consultations',
                  backgroundColor: Colors.transparent,
                  textColor: Colors.black54,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:2,right: 60),
                child: BoxContainer(
                  width: 440,
                  text: 'Feedbacks',
                  backgroundColor: Colors.transparent,
                  textColor: Colors.black54,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:2,right: 60),
                child: BoxContainer(
                  width: 440,
                  text: 'Medicine orders',
                  backgroundColor: Colors.transparent,
                  textColor: Colors.black54,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:2,right: 60),
                child: BoxContainer(
                  width: 440,
                  text: 'Diagnostic tests',
                  backgroundColor: Colors.transparent,
                  textColor: Colors.black54,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:2,right: 60),
                child: BoxContainer(
                  width: 440,
                  text: 'Diagnostic tests',
                  backgroundColor: Colors.transparent,
                  textColor: Colors.black54,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:2,right: 60),
                child: BoxContainer(
                  width: 440,
                  text: 'Health plans',
                  backgroundColor: Colors.transparent,
                  textColor: Colors.black54,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:2,right: 60),
                child: BoxContainer(
                  width: 440,
                  text: 'My account and Practo Drive',
                  backgroundColor: Colors.transparent,
                  textColor: Colors.black54,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:2,right: 60),
                child: BoxContainer(
                  width: 440,
                  text: 'Have a feature in mind',
                  backgroundColor: Colors.transparent,
                  textColor: Colors.black54,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:2,right: 60),
                child: BoxContainer(
                  width: 440,
                  text: 'Other issues',
                  backgroundColor: Colors.transparent,
                  textColor: Colors.black54,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

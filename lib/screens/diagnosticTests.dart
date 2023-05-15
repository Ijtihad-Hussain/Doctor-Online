import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tele_consult/screens/labTestScreen.dart';
import 'package:tele_consult/screens/patientDetails.dart';
import 'package:tele_consult/utils/colors.dart';

import '../widgets/button.dart';
import '../widgets/labTestCard.dart';
import '../widgets/pageDecoration.dart';

class DiagnosticTests extends StatelessWidget {
  const DiagnosticTests({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // leading: const Icon(
        //   Icons.arrow_back,
        //   color: Colors.black38,
        // ),
        title: const Text(
          'Book Lab Test',
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
              LabTestCard(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>
                    LabTestsScreen(),
                        // PatientDetails()
                    ),
                  );
                },
              ),
              LabTestCard(
                text1: 'Ghazi Lab',
                image: Image.asset('assets/images/lab2.jpg'),
                onPressed: (){},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

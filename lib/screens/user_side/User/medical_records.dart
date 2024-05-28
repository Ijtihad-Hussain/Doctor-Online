import 'package:flutter/material.dart';
import 'package:tele_consult/screens/User/add_record.dart';

import '../../utils/colors.dart';
import '../../widgets/button.dart';
import '../../widgets/page_decoration.dart';

class MedicalRecords extends StatelessWidget {
  const MedicalRecords({Key? key}) : super(key: key);

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
          'Medical Records',
          style: TextStyle(color: Colors.black38),
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
              const CircleAvatar(
                backgroundColor: kLightGreen,
                radius: 80,
                child: Icon(Icons.medical_information_sharp,
                  size: 60,
                  color: kInGreen,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(14.0),
                child: Text(
                  'Add a medical record',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ),
              const Text(
                'A detailed health history helps a doctor \ndiagnose you btter.',
                style: TextStyle(
                    fontSize: 12,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Button(
                  width: 200,
                  buttonText: 'Add a record',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddRecord()),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

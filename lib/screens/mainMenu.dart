import 'package:flutter/material.dart';
import 'package:tele_consult/screens/auth/sign_in.dart';
import 'package:tele_consult/screens/helpCenter.dart';
import 'package:tele_consult/screens/privacyPolicy.dart';
import 'package:tele_consult/widgets/pageDecoration.dart';

import '../utils/colors.dart';
import '../widgets/boxContainer.dart';
import 'aboutDoctor/findDoctors.dart';
import 'auth/doctorSignIn.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: PageDecoration.pageDecoration,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 60, right: 120),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PrivacyPolicy()),
                    );
                  },
                  child: BoxContainer(
                    text: 'Privacy Policy',
                    iconLeft: const Icon(Icons.privacy_tip_outlined),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, right: 120),
                child: GestureDetector(
                  onTap: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => Appointment()),
                    // );
                  },
                  child: BoxContainer(
                    text: 'Appointments',
                    iconLeft: const Icon(Icons.medical_information),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, right: 120),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FindDoctors()),
                    );
                  },
                  child: BoxContainer(
                    text: 'Search Doctor',
                    iconLeft: const Icon(Icons.search),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, right: 120),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignIn()),
                    );
                  },
                  child: BoxContainer(
                    text: 'Log In',
                    iconLeft: const Icon(Icons.login),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, right: 120),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HelpCenter()),
                    );
                  },
                  child: BoxContainer(
                    text: 'Help Center',
                    iconLeft: Icon(Icons.help_center),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, right: 120),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HelpCenter()),
                    );
                  },
                  child: BoxContainer(
                    text: 'About',
                    iconLeft: Icon(Icons.description),
                    // backgroundColor: kDarkGreen,
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

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tele_consult/screens/doctorSide/appointments.dart';

import '../../services/firebase_services.dart';
import '../../utils/colors.dart';
import '../../widgets/boxContainer.dart';
import '../../widgets/firstLetterAvatar.dart';
import '../User/medicalRecords.dart';
import '../User/myDoctors.dart';
import '../addTests.dart';
import '../auth/doctorSignIn.dart';
import '../auth/sign_in.dart';
import '../helpCenter.dart';
import '../privacyPolicy.dart';
import '../setting.dart';

class DoctorMenu extends StatefulWidget {
  const DoctorMenu({Key? key}) : super(key: key);

  @override
  State<DoctorMenu> createState() => _DoctorMenuState();
}

class _DoctorMenuState extends State<DoctorMenu> {
  String userName = 'Doctor Online';

  Future<String?> getCurrentUserName() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;

    if (user != null) {
      String? userEmail = user.email;
      DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userEmail)
          .get();

      if (userSnapshot.exists) {
        Map<String, dynamic>? userData = userSnapshot.data() as Map<String, dynamic>?;

        if (userData != null && userData.containsKey('name')) {
          print(userData['name']);
          userName = userData['name'];
          return userData['name'] as String?;
        }
      }
    }
    print('null');
    return null;
  }

  bool isLoggedIn() {
    final currentUser = FirebaseAuth.instance.currentUser;
    return currentUser != null;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUserName();
    print(userName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(color: kGBlue),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 60),
                child: Row(
                  children: [
                    FirstLetterAvatar(
                      text: userName,
                      radius: 24.r,
                      backgroundColor: Colors.blue,
                      textColor: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5, bottom: 5),
                      child: Text(
                        userName,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, right: 120),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Appointments()),
                    );
                  },
                  child: BoxContainer(
                    text: 'Appointments',
                    iconLeft: const Icon(Icons.contact_page_outlined),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, right: 120),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PrivacyPolicy()),
                    );
                  },
                  child: BoxContainer(
                    text: 'Privacy & Policy',
                    iconLeft: Icon(Icons.privacy_tip_outlined),
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
                      MaterialPageRoute(builder: (context) => Setting()),
                    );
                  },
                  child: BoxContainer(
                    text: 'Settings',
                    iconLeft: Icon(Icons.settings),
                  ),
                ),
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(20.0),
                    child: Icon(Icons.logout),
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            _buildLogoutDialog(context),
                      );
                    },
                    child: GestureDetector(
                      onTap: () {
                        if (isLoggedIn()) {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                _buildLogoutDialog(context),
                          );
                        } else {
                          Navigator.pushNamed(context, '/login');
                        }
                      },
                      child: Text(
                        isLoggedIn() ? 'Logout' : 'Log in',
                        style: TextStyle(color: Colors.black87, fontSize: 22),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildLogoutDialog(BuildContext context) {
  return AlertDialog(
    title: const Text('Log Out'),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const <Widget>[
        Text("Are you sure you want to logout?"),
      ],
    ),
    actions: <Widget>[
      TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text('Cancel'),
      ),
      TextButton(
        onPressed: () {
          FirebaseServices.signOut();
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => DoctorSignIn()),
          );
        },
        child: const Text('Ok'),
      ),
    ],
  );
}

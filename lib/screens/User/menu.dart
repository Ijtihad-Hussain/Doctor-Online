import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tele_consult/screens/User/medicalRecords.dart';
import 'package:tele_consult/screens/User/medicineOrderPage.dart';
import 'package:tele_consult/screens/addTests.dart';
import 'package:tele_consult/screens/diagnosticTests.dart';
import 'package:tele_consult/screens/helpCenter.dart';
import 'package:tele_consult/screens/privacyPolicy.dart';
import 'package:tele_consult/screens/setting.dart';
import 'package:tele_consult/utils/colors.dart';
import 'package:tele_consult/widgets/boxContainer.dart';
import 'package:tele_consult/widgets/customTextFormField.dart';
import 'package:tele_consult/widgets/doctorCardCircular.dart';
import 'package:tele_consult/widgets/pageDecoration.dart';

import '../../services/firebase_services.dart';
import '../../widgets/button.dart';
import '../../widgets/firstLetterAvatar.dart';
import '../auth/sign_in.dart';
import 'myDoctors.dart';

class Menu extends StatefulWidget {
  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {

  Future<String?> getCurrentUserName() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;

    if (user != null) {
      String userId = user.uid;
      DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();

      if (userSnapshot.exists) {
        Map<String, dynamic>? userData = userSnapshot.data() as Map<String, dynamic>?;

        if (userData != null && userData.containsKey('name')) {
          print(userData['name']);
          return userData['name'] as String?;
        }
      }
    }
    print('null');
    return null;
  }

  String userName = 'Doctor Online';

  bool isLoggedIn() {
    final currentUser = FirebaseAuth.instance.currentUser;
    return currentUser != null;
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUserName();
  }

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
                      MaterialPageRoute(builder: (context) => DiagnosticTests()),
                    );
                  },
                  child: BoxContainer(
                    text: 'Book Lab Test',
                    iconLeft: const Icon(Icons.book),
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
            MaterialPageRoute(builder: (context) => SignIn()),
          );
        },
        child: const Text('Ok'),
      ),
    ],
  );
}

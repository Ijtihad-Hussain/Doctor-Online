import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/doctor_side/doctor_menu_controller.dart';
import '../../utils/colors.dart';
import '../../widgets/box_container.dart';
import '../../widgets/first_letter_avatar.dart';
import '../user_side/help_center.dart';
import '../user_side/privacy_policy.dart';
import '../user_side/setting.dart';
import 'appointments.dart';

class DoctorMenu extends StatelessWidget {
  const DoctorMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final DoctorMenuController controller = Get.put(DoctorMenuController());

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
                    Obx(() {
                      return FirstLetterAvatar(
                        text: controller.userName.value,
                        radius: 24,
                        backgroundColor: Colors.blue,
                        textColor: Colors.white,
                      );
                    }),
                    Padding(
                      padding: const EdgeInsets.only(left: 5, bottom: 5),
                      child: Obx(() {
                        return Text(
                          controller.userName.value,
                          style: const TextStyle(color: Colors.white),
                        );
                      }),
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
                    iconLeft: const Icon(Icons.privacy_tip_outlined),
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
                    iconLeft: const Icon(Icons.settings),
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
                            _buildLogoutDialog(context, controller),
                      );
                    },
                    child: Obx(() {
                      return Text(
                        controller.isLoggedIn.value ? 'Logout' : 'Log in',
                        style: TextStyle(color: Colors.black87, fontSize: 22),
                      );
                    }),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogoutDialog(BuildContext context, DoctorMenuController controller) {
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
            controller.logout();
          },
          child: const Text('Ok'),
        ),
      ],
    );
  }
}

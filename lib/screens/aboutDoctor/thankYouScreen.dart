import 'package:flutter/material.dart';
import 'package:tele_consult/screens/aboutDoctor/appointment.dart';
import 'package:tele_consult/screens/home_screen.dart';
import 'package:tele_consult/utils/colors.dart';

import '../../widgets/button.dart';
import '../../widgets/pageDecoration.dart';

class ThankYouScreen extends StatelessWidget {
  const ThankYouScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: PageDecoration.pageDecoration,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 120),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CircleAvatar(
               backgroundColor: kLightBlue,
                radius: 80,
                child: Icon(Icons.thumb_up,
                  size: 60,
                  color: kBlue,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(14.0),
                child: Text(
                    'Thank You !',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              const Text(
                'Your Appointment Successful',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(14.0),
                child: Center(
                  child: Text(
                    'You booked an appointment with Dr.\n Pediatrician Purpieson on February 21, \nat 02:00 PM',
                    style: TextStyle(
                        fontSize: 12,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Button(
                  buttonText: 'Done',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(10),
              //   child: GestureDetector(
              //     onTap: () {
              //       Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => Appointment()),
              //       );
              //     },
              //     child: const Text(
              //       'Edit your appointment',
              //       style: TextStyle(
              //           fontSize: 14,
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

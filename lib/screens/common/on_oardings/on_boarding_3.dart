import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tele_consult/screens/user_side/home_screen.dart';
import 'package:tele_consult/widgets/page_decoration.dart';

import '../../../widgets/button.dart';
import '../auth/sign_in.dart';
import 'on_boarding_2.dart';

class OnBoarding3 extends StatelessWidget{
  const OnBoarding3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width:MediaQuery.of(context).size.width,
        decoration: PageDecoration.pageDecoration,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 60),
                child: CircleAvatar(
                  backgroundColor: Colors.black,
                  backgroundImage:
                      AssetImage('assets/images/national-cancer-institute-rb8hr3cXD4A-unsplash.jpg'),
                  // NetworkImage('https://images.unsplash.com/photo-1582719202047-76d3432ee323?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=987&q=80',
                  //   scale: 1.0,
                  // ),
                  radius: 180,
                ),
              ),
              const Text('Easy Appointments',
                style: TextStyle(
                    color: Colors.black87,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w600,
                    fontSize: 24
                ),
              ),
              const Text('Contrary to popular belief, Lorem Ipsum\nis not simply random text. It has roots in\na piece of it over 2000 years old.',
                style: TextStyle(color: Colors.black54,fontFamily: 'Rubik',fontSize: 12),
              ),
              const SizedBox(
                width: 10,
                height: 30,
              ),
              Button(
                width: 200,
                buttonText: 'Get Started',
                onPressed: () {
                  if (kIsWeb){

                  } else {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SignIn()),
                    );
                  }
                },
              ),
              TextButton(
                style: const ButtonStyle(
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                child: const Text('Skip',
                  style: TextStyle(color: Colors.black38),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
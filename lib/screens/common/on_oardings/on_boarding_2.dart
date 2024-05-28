import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../../widgets/button.dart';
import '../../../widgets/page_decoration.dart';
import '../auth/sign_in.dart';
import 'on_boarding_3.dart';

class OnBoarding2 extends StatelessWidget{
  const OnBoarding2({super.key});

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
                      AssetImage('assets/images/national-cancer-institute-s6w5NOxtm7U-unsplash_h1.jpg'),
                  radius: 180,
                ),
              ),
              const Text('Choose Best Doctors',
                style: TextStyle(
                    color: Colors.black87,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w600,
                    fontSize: 24
                ),
              ),
              const Text('Contrary to popular belief, Lorem Ipsum\nis not simply random text. It has roots in\na piece of it over 2000 years old.',
                style: TextStyle(
                    color: Colors.black54,
                    fontFamily: 'Rubik',
                    fontSize: 12
                ),
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
              const SizedBox(
                width: 10,
                height: 5,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const OnBoarding3()),
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
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:tele_consult/widgets/button.dart';

import '../../../widgets/page_decoration.dart';
import '../auth/sign_in.dart';
import 'on_boarding_2.dart';

class OnBoarding1 extends StatelessWidget{
  const OnBoarding1({super.key});
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
                Padding(
                  padding: EdgeInsets.only(top: 60),
                  child: Stack(
                    children: [
                      const CircleAvatar(
                        backgroundColor: Colors.black,
                        backgroundImage:
                            AssetImage('assets/images/artur-tumasjan-qLzWvcQq-V8-unsplash.jpg'),
                        // NetworkImage('https://images.unsplash.com/photo-1571772996211-2f02c9727629?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
                        radius: 180,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.greenAccent.withOpacity(.1),
                        radius: 180,
                      ),
                    ],
                  ),
                ),
                const Text('Find Trusted Doctors',
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
                const SizedBox(
                  width: 10,
                  height: 5,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => OnBoarding2()),
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
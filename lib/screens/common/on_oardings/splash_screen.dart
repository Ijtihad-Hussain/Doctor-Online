import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:tele_consult/screens/user_side/home_screen.dart';

import '../../../widgets/page_decoration.dart';
import 'on_boarding_1.dart';


class SplashScreen extends StatelessWidget {
  Future<FirebaseApp> initialize = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: initialize,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text("${snapshot.error}"),
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (BuildContext context, AsyncSnapshot streamSnapshot) {
              if (streamSnapshot.hasError) {
                return Scaffold(
                  body: Center(
                    child: Text("${streamSnapshot.error}"),
                  ),
                );
              }
              if (streamSnapshot.connectionState == ConnectionState.active) {
                User? user = streamSnapshot.data;
                if (user == null) {
                    return ScreenTypeLayout(
                      mobile: OnBoarding1(),
                      tablet: OnBoarding1(),
                      desktop: OnBoarding1(),
                    );
                } else {
                    return ScreenTypeLayout(
                      mobile: HomeScreen(),
                      tablet: HomeScreen(),
                      desktop: HomeScreen(),
                    );
                }
              }
              return Scaffold(
                body: Container(
                  decoration: PageDecoration.pageDecoration,
                  child: const Center(
                    child: Text(
                      'DOCTOR ONLINE',
                      style: TextStyle(
                        fontFamily: "Rubik",
                        fontWeight: FontWeight.w700,
                        fontSize: 34,
                        color: Color(0xFF222222),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        }
        return Scaffold(
          body: Container(
            decoration: PageDecoration.pageDecoration,
            child: const Center(
              child: Text(
                'DOCTOR ONLINE',
                style: TextStyle(
                  fontFamily: "Rubik",
                  fontWeight: FontWeight.w700,
                  fontSize: 34,
                  color: Color(0xFF222222),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

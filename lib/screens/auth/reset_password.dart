import 'package:flutter/material.dart';
import 'package:tele_consult/screens/auth/sign_in.dart';

import '../../utils/colors.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width:MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                kLightBlue,
                Colors.white,
                Colors.white,
              ],
            )
        ),
        padding: const EdgeInsets.symmetric(vertical: 160, horizontal: 60),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text('Reset password',
                style: TextStyle(
                    color: Colors.black87,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w600,
                    fontSize: 24
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  cursorColor: kLightBlue,
                  onSaved: (email) {},
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                    hintText: "New password",
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(12),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                child: TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  cursorColor: kLightBlue,
                  onSaved: (email) {},
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                    hintText: "Re-enter password",
                    hintStyle: TextStyle(),
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(12),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Hero(
                tag: "login_btn",
                child: ElevatedButton(
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(kInGreen),
                    fixedSize: MaterialStatePropertyAll(Size(250,10)),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignIn()),
                    );
                  },
                  child: const Text(
                    "Continue",
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

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/common/auth/forgot_password_controller.dart';

class ForgotPassword extends StatelessWidget {
  ForgotPassword({super.key});
  final ForgotPasswordController _controller = Get.put(ForgotPasswordController());

  @override
  Widget build(BuildContext context) {
    TextEditingController emailC = TextEditingController();

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 160, horizontal: 60),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text('Forgot password',
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
                child: TextField(
                  controller: emailC,
                  decoration: const InputDecoration(
                    hintText: 'Enter email',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: (){
                  _controller.sendPasswordResetEmail(emailC.text);
                },
                child: const Text('Continue'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



import 'package:flutter/material.dart';
import 'package:tele_consult/screens/auth/reset_password.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../utils/colors.dart';
import '../../utils/utils.dart';
import '../../widgets/button.dart';
import '../../widgets/customTextFormField.dart';
import '../../widgets/pageDecoration.dart';

class ForgotPassword extends StatelessWidget {
  TextEditingController emailC = TextEditingController();
  final auth = FirebaseAuth.instance;

  ForgotPassword({super.key});

  @override

  Widget build(BuildContext context) {
    Future<void> ecoDialogue(String error) async {
      showDialog(
          context: context,
          builder: (_) {
            return AlertDialog(
              title: Text(error),
              actions: [
                Button(
                  buttonText: 'CLOSE',
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          });
    }
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width:MediaQuery.of(context).size.width,
        decoration: PageDecoration.pageDecoration,
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
                child: CustomTextFormField(
                  controller: emailC,
                  hintText: 'Enter email',
                  border: const OutlineInputBorder(),
                ),
              ),
              Button(
                buttonText: 'Continue',
                width: 180,
                onPressed: (){
                  auth.sendPasswordResetEmail(email: emailC.text.toString()).then((value) {
                    Utils().toastMessage('An email has been sent to recover password');
                  }).onError((error, stackTrace){
                    Utils().toastMessage(error.toString());
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

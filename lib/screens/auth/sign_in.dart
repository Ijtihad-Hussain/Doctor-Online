import 'package:flutter/material.dart';
import 'package:tele_consult/screens/auth/forgot_password.dart';
import 'package:tele_consult/screens/auth/sign_up.dart';
import 'package:tele_consult/services/firebase_services.dart';
import 'package:tele_consult/widgets/button.dart';
import 'package:tele_consult/widgets/customTextFormField.dart';
import 'package:tele_consult/widgets/pageDecoration.dart';

import '../../utils/colors.dart';
import '../../widgets/boxContainer.dart';
import '../User/menu.dart';
import 'doctorSignIn.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final formKey = GlobalKey<FormState>();
  bool obsText = true;
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  bool formStateLoading = false;

  void toggle() {
    setState(() {
      obsText = !obsText;
    });
  }

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

  submit() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        formStateLoading = true;
      });

      String? accountstatus =
      await FirebaseServices.signInAccount(emailC.text, passwordC.text);

      // print(accountstatus);
      if (accountstatus != null) {
        ecoDialogue(accountstatus);
        setState(() {
          formStateLoading = false;
        });
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => Menu()));
      }
    }
  }

  @override
  void dispose() {
    emailC.dispose();
    passwordC.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: PageDecoration.pageDecoration,
        padding: const EdgeInsets.symmetric(vertical: 120, horizontal: 60),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                const Text(
                  'Welcome back',
                  style: TextStyle(
                      color: Colors.black87,
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.w600,
                      fontSize: 24),
                ),
                const SizedBox(
                  height: 24,
                ),
                CustomTextFormField(
                  validate: (v) {
                    if (v!.isEmpty || !v.contains('@')) {
                      return 'Email is not valid';
                    }
                    return null;
                  },
                  hintText: 'Email...',
                  controller: emailC,
                  border: const OutlineInputBorder(),
                ),
                CustomTextFormField(
                  hintText: 'Password...',
                  controller: passwordC,
                  validate: (v) {
                    if (v!.isEmpty) {
                      return "password should not be empty";
                    }
                    return null;
                  },
                  suffixIcon: IconButton(
                    icon: obsText == false
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                    onPressed: toggle,
                  ),
                  obscureText: obsText,
                  border: const OutlineInputBorder(),
                ),
                Button(
                  // color: kInGreen,
                  isLoading: formStateLoading,
                  buttonText: 'Sign In',
                  width: 180,
                  onPressed: () {
                    submit();
                  },
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ForgotPassword()),
                    );
                  },
                  child: const Text(
                    'Forgot password',
                    style: TextStyle(color: Colors.black38),
                  ),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignUp()),
                    );
                  },
                  child: const Text(
                    "Don't have an account? sign up",
                    style: TextStyle(color: Colors.black38),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => DoctorSignIn()),
                    );
                  },
                  child: Center(child: Text('Are you a doctor')),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
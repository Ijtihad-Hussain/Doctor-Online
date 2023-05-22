import 'package:flutter/material.dart';
import 'package:tele_consult/screens/auth/forgot_password.dart';
import 'package:tele_consult/screens/auth/sign_up.dart';
import 'package:tele_consult/services/firebase_services.dart';
import 'package:tele_consult/widgets/button.dart';
import 'package:tele_consult/widgets/customTextFormField.dart';
import 'package:tele_consult/widgets/pageDecoration.dart';

import '../../services/authService.dart';
import '../User/menu.dart';
import '../doctorSide/doctorHome.dart';
import '../home_screen.dart';
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

  void login() async {
    String email = emailC.text;
    String password = passwordC.text;

    AuthService authService = AuthService();
    try {
      CustomUser? user = await authService.signInWithEmailAndPassword(email, password);
      if (user != null) {
        // Redirect the user based on their role
        if (user.role == 'patient') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        }
      } else {
        print('Failed to sign in. Invalid email or password.');
      }
    } catch (e) {
      print('An error occurred during login: $e');
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
                    login();
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
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => DoctorSignIn()),
                          );
                        },
                        child: Text(
                          'Are you a doctor?',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tele_consult/screens/auth/sign_in.dart';
import 'package:tele_consult/screens/home_screen.dart';
import '../../services/authService.dart';
import '../../services/firebase_services.dart';
import '../../widgets/button.dart';
import '../../widgets/customTextFormField.dart';
import '../../widgets/pageDecoration.dart';
import '../User/menu.dart';
import '../doctorSide/doctorHome.dart';
import 'forgot_password.dart';


class DoctorSignIn extends StatefulWidget {
  const DoctorSignIn({Key? key}) : super(key: key);

  @override
  State<DoctorSignIn> createState() => _DoctorSignInState();
}

class _DoctorSignInState extends State<DoctorSignIn> {
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

  // submit() async {
  //   if (formKey.currentState!.validate()) {
  //     setState(() {
  //       formStateLoading = true;
  //     });
  //
  //     String? accountstatus =
  //     await FirebaseServices.signInAccount(emailC.text, passwordC.text);
  //
  //     // print(accountstatus);
  //     if (accountstatus != null) {
  //       ecoDialogue(accountstatus);
  //       setState(() {
  //         formStateLoading = false;
  //       });
  //     } else {
  //       Navigator.push(
  //           context, MaterialPageRoute(builder: (_) => DoctorHome()));
  //     }
  //   }
  // }
  submit() async {
    if (formKey.currentState!.validate()) {
      setState(() {
        formStateLoading = true;
      });

      // Retrieve the user document from Firestore
      DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
          .collection('users').doc(emailC.text)
          .get();

      // Check if the user exists and has the 'doctor' role
      if (userSnapshot.exists && (userSnapshot.data() as Map<String, dynamic>)['role'] == 'doctor') {
        String? accountstatus =
        await FirebaseServices.signInAccount(
            emailC.text, passwordC.text);

        print(accountstatus);

        if (accountstatus != null) {
          ecoDialogue(accountstatus);
          setState(() {
            formStateLoading = false;
          });
        } else {
          Navigator.push(
              context, MaterialPageRoute(builder: (_) => DoctorHome()));
        }
      } else {
        ecoDialogue('Access denied. Please sign in as a doctor.');
        setState(() {
          formStateLoading = false;
        });
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
        if (user.role == 'doctor') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => DoctorHome()),
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
                  'Welcome Doctor',
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
                    // submit();
                  },
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DoctorHome()),
                    );
                  },
                  child: const Text(
                    'Forgot password',
                    style: TextStyle(color: Colors.black38),
                  ),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SignIn()),
                    );
                  },
                  child: const Text(
                    'Sign In as Patient',
                    style: TextStyle(
                      color: Colors.black38,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Roboto',
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
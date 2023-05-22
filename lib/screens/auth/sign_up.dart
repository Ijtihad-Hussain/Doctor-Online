import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tele_consult/screens/auth/sign_in.dart';
import 'package:tele_consult/screens/home_screen.dart';
import 'package:tele_consult/widgets/customTextFormField.dart';

import '../../services/firebase_services.dart';
import '../../widgets/button.dart';
import '../../widgets/pageDecoration.dart';
import '../User/menu.dart';
import 'otpScreen.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool checkedValue = false;
  final formKey = GlobalKey<FormState>();
  bool obsText = true;
  TextEditingController countryController = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController passwordC = TextEditingController();
  TextEditingController nameC = TextEditingController();
  TextEditingController phoneC = TextEditingController();
  bool formStateLoading = false;

  void toggle() {
    setState(() {
      obsText = !obsText;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    emailC.dispose();
    nameC.dispose();
    passwordC.dispose();
    phoneC.dispose();
    super.dispose();
  }

  @override
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
                  'Join us to start searching',
                  style: TextStyle(
                    color: Colors.black87,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                CustomTextFormField(
                  validate: (v) {
                    if (v!.isEmpty) {
                      return "Name section should not be empty";
                    }
                    return null;
                  },
                  hintText: 'Name...',
                  controller: nameC,
                  inputAction: TextInputAction.next,
                  border: const OutlineInputBorder(),
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
                  validate: (v) {
                    if (v!.isEmpty) {
                      return "password should not be empty";
                    }
                    return null;
                  },
                  hintText: 'Password...',
                  controller: passwordC,
                  suffixIcon: IconButton(
                    icon: obsText == false
                        ? const Icon(Icons.visibility)
                        : const Icon(Icons.visibility_off),
                    onPressed: toggle,
                  ),
                  obscureText: obsText,
                  border: const OutlineInputBorder(),
                ),
                // const SizedBox(height: 10),
                // Stack(
                //   children: [
                //     CheckboxListTile(
                //       value: checkedValue,
                //       onChanged: (var newValue) {
                //         setState(() {
                //           checkedValue = newValue!;
                //         });
                //       },
                //       controlAffinity: ListTileControlAffinity
                //           .leading, //  <-- leading Checkbox
                //     ),
                //     const Positioned(
                //       top: 22,
                //       left: 50,
                //       child: Text(
                //         "I agree with the Terms of Service & Privacy Policy",
                //         style: TextStyle(
                //           color: Colors.black38,
                //           fontSize: 10,
                //         ),
                //       ),
                //     ),
                //   ],
                // ),
                const SizedBox(height: 10),
                Button(
                  // color: kInGreen,
                  buttonText: 'Sign Up',
                  width: 180.w,
                  onPressed: () async {
                    registerUser();
                    // submit();
                  },
                  isLoading: formStateLoading,
                  // isLoading: formStateLoading,
                ),
                const SizedBox(height: 5),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignIn()),
                    );
                  },
                  child: const Text(
                    "Have an account? sign in",
                    style: TextStyle(color: Colors.black38),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future registerUser() async {
    final userCollectionReference =
    FirebaseFirestore.instance.collection('users');

    final patientCollectionReference =
    FirebaseFirestore.instance.collection('patients');
    // Save the data to Firestore
    try {
      final DocumentReference userDocumentReference =
      await userCollectionReference.add({
        'patientId': '', // Placeholder value for doctorId
        'email': emailC.text,
        'name': nameC.text,
        'role': 'patient',
      });

      // Set the document ID as the doctorId field value
      await userDocumentReference.update({
        'patientId': userDocumentReference.id,
      });

      // Create user in Firebase Authentication with the doctor's email and password
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: emailC.text,
        password: passwordC.text,
      );

      // Add doctor data to the 'doctors' collection
      await patientCollectionReference
          .doc(userDocumentReference.id)
          .set({
        'email': emailC.text,
        'name': nameC.text,
        'role': 'patient',
      });

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => SignIn(),
          // OTPScreen(phoneC.text),
        ),
      );

      print(
          'Added a patient with ID: ${userDocumentReference.id}');
    } catch (e) {
      print('Failed to add patient: $e');
    }
  }
}

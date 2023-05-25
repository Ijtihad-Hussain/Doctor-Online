import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tele_consult/screens/auth/sign_in.dart';
import 'package:tele_consult/widgets/customTextFormField.dart';
import '../../widgets/button.dart';
import '../../widgets/newTextFormField.dart';
import '../../widgets/pageDecoration.dart';

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
                const SizedBox(height: 10),
                NewCustomTextFormField(
                  validate: (v) {
                    if (v!.isEmpty) {
                      return "Phone number should not be empty";
                    } else if (v.length != 11) {
                      return "Phone number should be exactly 11 digits";
                    }
                    return null;
                  },
                  hintText: 'Phone...',
                  controller: phoneC,
                  keyboardType: TextInputType.phone,
                  border: const OutlineInputBorder(),
                ),
                const SizedBox(height: 10),
                Button(
                  buttonText: 'Sign Up',
                  width: 180.w,
                  onPressed: () async {
                    registerUser();
                  },
                  isLoading: formStateLoading,
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
        'patientId': '', // Placeholder value for patientId
        'email': emailC.text,
        'name': nameC.text,
        'role': 'patient',
        'phone': phoneC.text, // Add the 'phone' field
      });

      await userDocumentReference.update({
        'patientId': userDocumentReference.id,
      });

      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: emailC.text,
        password: passwordC.text,
      );

      await patientCollectionReference
          .doc(userDocumentReference.id)
          .set({
        'email': emailC.text,
        'name': nameC.text,
        'role': 'patient',
        'phone': phoneC.text, // Add the 'phone' field
      });

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => SignIn(),
        ),
      );

      print(
          'Added a patient with ID: ${userDocumentReference.id}');
    } catch (e) {
      print('Failed to add patient: $e');
    }
  }
}

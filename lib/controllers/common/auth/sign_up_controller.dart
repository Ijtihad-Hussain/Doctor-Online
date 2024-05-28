import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../screens/common/auth/sign_in.dart';

class SignUpController extends GetxController {
  final formKey = GlobalKey<FormState>();
  var obsText = true.obs;
  var formStateLoading = false.obs;

  var countryController = TextEditingController();
  var emailC = TextEditingController();
  var passwordC = TextEditingController();
  var nameC = TextEditingController();
  var phoneC = TextEditingController();

  void togglePasswordVisibility() {
    obsText.value = !obsText.value;
  }

  Future<void> registerUser() async {
    if (formKey.currentState!.validate()) {
      formStateLoading.value = true;

      final userCollectionReference = FirebaseFirestore.instance.collection('users');
      final patientCollectionReference = FirebaseFirestore.instance.collection('patients');

      try {
        final DocumentReference userDocumentReference = await userCollectionReference.add({
          'patientId': '',
          'email': emailC.text,
          'name': nameC.text,
          'role': 'patient',
          'phone': phoneC.text,
        });

        await userDocumentReference.update({
          'patientId': userDocumentReference.id,
        });

        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailC.text,
          password: passwordC.text,
        );

        await patientCollectionReference.doc(userDocumentReference.id).set({
          'email': emailC.text,
          'name': nameC.text,
          'role': 'patient',
          'phone': phoneC.text,
        });

        Get.off(() => SignIn());
      } catch (e) {
        Get.snackbar('Error', 'Failed to add patient: $e');
      } finally {
        formStateLoading.value = false;
      }
    }
  }

  @override
  void dispose() {
    emailC.dispose();
    nameC.dispose();
    passwordC.dispose();
    phoneC.dispose();
    super.dispose();
  }
}

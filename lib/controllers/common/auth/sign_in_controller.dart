import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../screens/user_side/User/menu.dart';
import '../../../screens/user_side/home_screen.dart';
import '../../../services/auth_service.dart';
import '../../../services/firebase_services.dart';

class SignInController extends GetxController {
  final formKey = GlobalKey<FormState>();
  var obsText = true.obs;
  var emailC = TextEditingController();
  var passwordC = TextEditingController();
  var formStateLoading = false.obs;

  void togglePasswordVisibility() {
    obsText.value = !obsText.value;
  }

  Future<void> ecoDialogue(String error) async {
    Get.dialog(
      AlertDialog(
        title: Text(error),
        actions: [
          TextButton(
            child: const Text('CLOSE'),
            onPressed: () {
              Get.back();
            },
          ),
        ],
      ),
    );
  }

  Future<void> submit() async {
    if (formKey.currentState!.validate()) {
      formStateLoading.value = true;

      String? accountStatus = await FirebaseServices.signInAccount(emailC.text, passwordC.text);

      if (accountStatus != null) {
        ecoDialogue(accountStatus);
        formStateLoading.value = false;
      } else {
        Get.offAll(() => Menu());
      }
    }
  }

  Future<void> login() async {
    String email = emailC.text;
    String password = passwordC.text;

    AuthService authService = AuthService();
    try {
      CustomUser? user = await authService.signInWithEmailAndPassword(email, password);
      if (user != null) {
        if (user.role == 'patient') {
          Get.offAll(() => HomeScreen());
        }
      } else {
        ecoDialogue('Failed to sign in. Invalid email or password.');
      }
    } catch (e) {
      ecoDialogue('An error occurred during login: $e');
    }
  }

  @override
  void dispose() {
    emailC.dispose();
    passwordC.dispose();
    super.dispose();
  }
}

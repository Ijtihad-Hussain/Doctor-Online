import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorSignInController extends GetxController {
  final formKey = GlobalKey<FormState>();
  var obsText = true.obs;
  var formStateLoading = false.obs;
  var emailC = TextEditingController();
  var passwordC = TextEditingController();

  void toggleObsText() {
    obsText.value = !obsText.value;
  }

  Future<void> ecoDialogue(String error) async {
    Get.dialog(
      AlertDialog(
        title: Text(error),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: const Text('CLOSE'),
          ),
        ],
      ),
    );
  }

  void login() async {
    if (formKey.currentState!.validate()) {
      formStateLoading.value = true;
      await Future.delayed(const Duration(seconds: 2));
      Get.offAllNamed('/doctor-home');
      formStateLoading.value = false;
    }
  }

  @override
  void onClose() {
    emailC.dispose();
    passwordC.dispose();
    super.onClose();
  }
}

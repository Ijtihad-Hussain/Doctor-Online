import 'package:flutter/material.dart';
import 'package:tele_consult/screens/common/auth/sign_up.dart';
import 'package:tele_consult/widgets/button.dart';
import 'package:tele_consult/widgets/custom_text_form_field.dart';
import 'package:tele_consult/widgets/page_decoration.dart';
import '../../../controllers/common/auth/sign_in_controller.dart';
import 'doctor_sign_in.dart';
import 'forgot_password.dart';
import 'package:get/get.dart';

class SignIn extends StatelessWidget {
  final SignInController controller = Get.put(SignInController());

  SignIn({Key? key}) : super(key: key);

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
            key: controller.formKey,
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
                const SizedBox(height: 24),
                CustomTextFormField(
                  validate: (v) {
                    if (v!.isEmpty || !v.contains('@')) {
                      return 'Email is not valid';
                    }
                    return null;
                  },
                  hintText: 'Email...',
                  controller: controller.emailC,
                  border: const OutlineInputBorder(),
                ),
                Obx(
                      () => CustomTextFormField(
                    hintText: 'Password...',
                    controller: controller.passwordC,
                    validate: (v) {
                      if (v!.isEmpty) {
                        return "password should not be empty";
                      }
                      return null;
                    },
                    suffixIcon: IconButton(
                      icon: controller.obsText.value
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility),
                      onPressed: controller.togglePasswordVisibility,
                    ),
                    obscureText: controller.obsText.value,
                    border: const OutlineInputBorder(),
                  ),
                ),
                Obx(
                      () => Button(
                    isLoading: controller.formStateLoading.value,
                    buttonText: 'Sign In',
                    width: 180,
                    onPressed: controller.login,
                  ),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Get.to(() => ForgotPassword());
                  },
                  child: const Text(
                    'Forgot password',
                    style: TextStyle(color: Colors.black38),
                  ),
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Get.to(() => SignUp());
                  },
                  child: const Text(
                    "Don't have an account? sign up",
                    style: TextStyle(color: Colors.black38),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(() => DoctorSignIn());
                  },
                  child: Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

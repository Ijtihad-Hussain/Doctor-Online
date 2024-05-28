import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/common/auth/sign_up_controller.dart';
import '../../../widgets/button.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../../../widgets/page_decoration.dart';
import 'sign_in.dart';

class SignUp extends StatelessWidget {
  final SignUpController controller = Get.put(SignUpController());

  SignUp({Key? key}) : super(key: key);

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
                  'Join us to start searching',
                  style: TextStyle(
                    color: Colors.black87,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                  ),
                ),
                const SizedBox(height: 24),
                CustomTextFormField(
                  validate: (v) {
                    if (v!.isEmpty) {
                      return "Name section should not be empty";
                    }
                    return null;
                  },
                  hintText: 'Name...',
                  controller: controller.nameC,
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
                  controller: controller.emailC,
                  border: const OutlineInputBorder(),
                ),
                Obx(
                      () => CustomTextFormField(
                    validate: (v) {
                      if (v!.isEmpty) {
                        return "Password should not be empty";
                      }
                      return null;
                    },
                    hintText: 'Password...',
                    controller: controller.passwordC,
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
                const SizedBox(height: 10),
                CustomTextFormField(
                  validate: (v) {
                    if (v!.isEmpty) {
                      return "Phone number should not be empty";
                    } else if (v.length != 11) {
                      return "Phone number should be exactly 11 digits";
                    }
                    return null;
                  },
                  hintText: 'Phone...',
                  controller: controller.phoneC,
                  keyBoardType: TextInputType.phone,
                  border: const OutlineInputBorder(),
                ),
                const SizedBox(height: 10),
                Obx(
                      () => Button(
                    buttonText: 'Sign Up',
                    width: 180,
                    onPressed: controller.registerUser,
                    isLoading: controller.formStateLoading.value,
                  ),
                ),
                const SizedBox(height: 5),
                TextButton(
                  onPressed: () {
                    Get.to(() => SignIn());
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
}

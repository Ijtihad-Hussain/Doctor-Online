import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/common/auth/doctor_sign_in_controller.dart';

class DoctorSignIn extends StatelessWidget {
  final DoctorSignInController _controller = Get.put(DoctorSignInController());

  DoctorSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 120, horizontal: 60),
        child: SingleChildScrollView(
          child: Form(
            key: _controller.formKey,
            child: Column(
              children: [
                const Text(
                  'Welcome Doctor',
                  style: TextStyle(
                    color: Colors.black87,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFormField(
                  controller: _controller.emailC,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty || !value.contains('@')) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Email...',
                    border: OutlineInputBorder(),
                  ),
                ),
                TextFormField(
                  controller: _controller.passwordC,
                  obscureText: _controller.obsText.value,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please enter a password';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Password...',
                    suffixIcon: IconButton(
                      icon: _controller.obsText.value
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility),
                      onPressed: () => _controller.toggleObsText(),
                    ),
                    border: OutlineInputBorder(),
                  ),
                ),
                Obx(() {
                  return ElevatedButton(
                    onPressed: () {
                      _controller.login();
                    },
                    child: _controller.formStateLoading.value
                        ? CircularProgressIndicator()
                        : Text('Sign In'),
                  );
                }),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    // Navigate to ForgotPassword screen
                    Get.toNamed('/forgot-password');
                  },
                  child: const Text(
                    'Forgot password',
                    style: TextStyle(color: Colors.black38),
                  ),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    // Navigate to SignIn screen
                    Get.toNamed('/sign-in');
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

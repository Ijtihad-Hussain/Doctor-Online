import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../screens/user_side/User/menu.dart';

class OTPScreenController extends GetxController {
  var verificationCode = ''.obs;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void verifyPhone(String phone) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: '+92$phone',
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential).then((value) async {
          if (value.user != null) {
            Get.offAll(Menu());
          }
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        Get.snackbar('Error', e.message ?? 'Verification failed');
      },
      codeSent: (String? verficationID, int? resendToken) {
        verificationCode.value = verficationID!;
      },
      codeAutoRetrievalTimeout: (String verificationID) {
        verificationCode.value = verificationID;
      },
      timeout: const Duration(seconds: 120),
    );
  }

  void verifyOTP(String otp) async {
    try {
      await _auth.signInWithCredential(
        PhoneAuthProvider.credential(
          verificationId: verificationCode.value,
          smsCode: otp,
        ),
      ).then((value) async {
        if (value.user != null) {
          Get.offAll(Menu());
        }
      });
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}

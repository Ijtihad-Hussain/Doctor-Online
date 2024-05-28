import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../../controllers/common/auth/otp_screen_controller.dart';
import 'package:get/get.dart';

class OTPScreen extends StatelessWidget {
  final String phone;
  final OTPScreenController _otpController = Get.put(OTPScreenController());
  final TextEditingController _pinPutController = TextEditingController();

  OTPScreen(this.phone, {super.key});

  final defaultPinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: const TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black),
      borderRadius: BorderRadius.circular(20),
    ),
  );

  @override
  Widget build(BuildContext context) {
    _otpController.verifyPhone(phone);
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP Verification'),
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 40),
            child: Center(
              child: Text(
                'Verify +92-$phone',
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Pinput(
              length: 6,
              defaultPinTheme: defaultPinTheme,
              controller: _pinPutController,
              pinAnimationType: PinAnimationType.fade,
              onSubmitted: (pin) {
                _otpController.verifyOTP(pin);
              },
            ),
          ),
        ],
      ),
    );
  }
}

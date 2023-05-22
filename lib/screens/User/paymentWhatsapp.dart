import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PaymentWhatsapp extends StatelessWidget {
  final String bankName;
  final String bankAccountNo;
  final String iban;
  final double amountToPay;

  PaymentWhatsapp({
    required this.bankName,
    required this.bankAccountNo,
    required this.iban,
    required this.amountToPay,
  });

  void _sendWhatsAppMessage() async {
    final whatsappNumber = '+923018524404'; // Replace with admin's WhatsApp number
    final message = 'Payment Screenshot\n\nBank Name: $bankName\nAccount No: $bankAccountNo\nIBAN: $iban\nAmount: $amountToPay';

    final whatsappUrl = 'https://wa.me/$whatsappNumber?text=${Uri.encodeComponent(message)}';

    if (await canLaunch(whatsappUrl)) {
      await launch(whatsappUrl);
    } else {
      throw 'Could not launch WhatsApp';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bank:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              bankName,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Account No:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              bankAccountNo,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'IBAN:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              iban,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Amount to Pay:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '$amountToPay',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 40),
            Center(
              child: ElevatedButton(
                onPressed: _sendWhatsAppMessage,
                child: Text(
                  'Send Screenshot',
                  style: TextStyle(fontSize: 16),
                ),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  primary: Colors.green,
                  onPrimary: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            SizedBox(height: 12.h),
            Center(
              child: Text(
                'Send a transaction screenshot through WhatsApp',
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


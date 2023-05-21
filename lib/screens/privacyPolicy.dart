import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy Policy'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Privacy Policy',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Last updated: [Insert date]',
              style: TextStyle(
                fontStyle: FontStyle.italic,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Information We Collect:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            BulletPointText(
              text:
                  'Personal Information: When you use the Doctor Online app, we may collect personal information such as your name, email address, phone number, and demographic details. This information is provided voluntarily by you during the registration process.',
            ),
            BulletPointText(
              text:
                  'Medical Information: In order to provide accurate healthcare services, we may collect medical information such as symptoms, medical history, and any other relevant details you provide during consultations or interactions with healthcare professionals through the app.',
            ),
            BulletPointText(
              text:
                  'Device Information: We may collect information about the device you use to access the app, including the device type, operating system, unique device identifiers, and mobile network information.',
            ),
            SizedBox(height: 16),
            Text(
              'Use of Collected Information:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            BulletPointText(
              text:
                  'Personal Information: We use your personal information to create and manage your user account, facilitate communication with healthcare professionals, process payments, and provide personalized services tailored to your healthcare needs.',
            ),
            BulletPointText(
              text:
                  'Medical Information: The medical information you provide is used to deliver appropriate healthcare services, including diagnosis, treatment recommendations, and ongoing care management.',
            ),
            BulletPointText(
              text:
                  'Communication: We may use your contact information to send important updates, appointment reminders, and notifications related to your healthcare services.',
            ),
            BulletPointText(
              text:
                  'Data Analysis: We may anonymize and aggregate user data to analyze app usage patterns, improve our services, and enhance the user experience.',
            ),
            SizedBox(height: 16),
            Text(
              'Data Security:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            BulletPointText(
              text:
                  'We implement appropriate security measures to protect your personal and medical information from unauthorized access, disclosure, alteration, or destruction.',
            ),
            BulletPointText(
              text:
                  'We store and transmit data using industry-standard encryption protocols and follow best practices to ensure the security of your information.',
            ),
            SizedBox(height: 16),
            Text(
              'Data Sharing:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            BulletPointText(
              text:
                  'We do not sell, trade, or rent your personal or medical information to third parties without your explicit consent.',
            ),
            BulletPointText(
              text:
                  'We may share your information with healthcare professionals and service providers who are involved in delivering the requested healthcare services.',
            ),
            BulletPointText(
              text:
                  'We may disclose your information when required by law or to protect our rights, safety, or the safety of others.',
            ),
            SizedBox(height: 16),
            Text(
              'Data Retention:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            BulletPointText(
              text:
                  'We retain your personal and medical information only for as long as necessary to fulfill the purposes outlined in this Privacy Policy, unless a longer retention period is required or permitted by law.',
            ),
            SizedBox(height: 16),
            Text(
              'User Control:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            BulletPointText(
              text:
                  'You have the right to access, update, and delete your personal information stored in our app. You can do so by accessing the account settings within the app or by contacting our support team.',
            ),
            BulletPointText(
              text:
                  'You may choose to disable certain app permissions or opt-out of receiving promotional communications.',
            ),
            SizedBox(height: 16),
            Text(
              'Changes to the Privacy Policy:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'We reserve the right to update or modify this Privacy Policy at any time. Any changes will be notified through the app or via email.',
            ),
            SizedBox(height: 16),
            Text(
              'Please review this Privacy Policy carefully. By using the Doctor Online mobile app, you consent to the collection, use, and disclosure of your information as described in this Privacy Policy.',
            ),
            SizedBox(height: 16),
            Text(
              'If you have any questions or concerns about our Privacy Policy or data practices, please contact our support team for further assistance.',
            ),
          ],
        ),
      ),
    );
  }
}

class BulletPointText extends StatelessWidget {
  final String text;

  const BulletPointText({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 8),
        Icon(Icons.circle, size: 6),
        SizedBox(width: 8),
        Expanded(child: Text(text)),
      ],
    );
  }
}

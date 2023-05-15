import 'package:flutter/material.dart';
import 'package:tele_consult/screens/User/paymentPage.dart';
import 'package:tele_consult/widgets/button.dart';

class EmergencyDoctorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Online Doctors'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Our online doctors are available for emergency calls 24/7. Please select a doctor to start the call:',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 16.0),
            DoctorCard(
              name: 'Dr. John Smith',
              specialty: 'Emergency Medicine',
              imageUrl: 'https://i.pravatar.cc/150?img=4',
              onTap: () {
                // Add logic to initiate the call
              },
            ),
            DoctorCard(
              name: 'Dr. Jane Doe',
              specialty: 'Internal Medicine',
              imageUrl: 'https://i.pravatar.cc/150?img=2',
              onTap: () {
                // Add logic to initiate the call
              },
            ),
            DoctorCard(
              name: 'Dr. Sarah Johnson',
              specialty: 'Pediatrics',
              imageUrl: 'https://i.pravatar.cc/150?img=5',
              onTap: () {
                // Add logic to initiate the call
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DoctorCard extends StatelessWidget {
  final String name;
  final String specialty;
  final String imageUrl;
  final VoidCallback onTap;

  const DoctorCard({
    Key? key,
    required this.name,
    required this.specialty,
    required this.imageUrl,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 30.0,
                backgroundImage: NetworkImage(imageUrl),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(specialty),
                  ],
                ),
              ),
            ),
            Button(
              buttonText: 'Call Now',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PaymentPage()),
                );
              },
              ),
          ],
        ),
      ),
    );
  }
}

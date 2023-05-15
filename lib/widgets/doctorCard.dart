import 'package:flutter/material.dart';

import '../screens/aboutDoctor/doctorProfilePage.dart';

class DoctorCart extends StatelessWidget {
  final String name;
  final String specialization;
  final String experience;
  final ImageProvider<Object> image;

  DoctorCart({
    required this.name,
    required this.specialization,
    required this.experience,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DoctorProfilePage(
              doctorName: name,
              specialization: specialization,
              experience: experience,
              image: image,
            ),
          ),
        );
      },
      child: Card(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                radius: 30,
                backgroundImage: image,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 5),
                  Text(
                    specialization,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '$experience',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ClipRRectCard extends StatelessWidget {
  Image? image;
  String? name;
  String? specialization;

  ClipRRectCard({super.key, this.image,this.name,this.specialization});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Column(
        children: [
          image ?? Image.asset(
            'assets/images/gy1.png',
            height: 120.0,
            width: 120.0,
          ),
          Text(
            name ?? 'Dr. San Forb',
            style: const TextStyle(
                color: Colors.black54,
                fontFamily: 'Rubik',
                fontWeight: FontWeight.w500,
                fontSize: 12),
          ),
          Text(
            specialization ?? 'Medical Specialist',
            style: const TextStyle(
                color: Colors.black54,
                fontFamily: 'Rubik',
                fontWeight: FontWeight.w100,
                fontSize: 10),
          ),
        ],
      ),
    );
  }
}
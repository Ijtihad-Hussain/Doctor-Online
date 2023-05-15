
import 'package:flutter/material.dart';

class Doctor {
  final String name;
  final String speciality;
  final String? experience;
  final String? availability;
  final Image image;

  Doctor({required this.name, required this.speciality, required this.image, this.availability,this.experience});
}


// create a list of doctors to display in the ListView
final List<Doctor> doctors = [
  Doctor(
    name: 'Dr. John Doe',
    speciality: 'Cardiology',
    image: Image.network('assets/images/doctorm.jpg',height: 80, width: 50, fit: BoxFit.fill),
  ),
  Doctor(
    name: 'Dr. Jane Smith',
    speciality: 'Pediatrics',
    image: Image.network('assets/images/doctorm.jpg', height: 80, width: 50, fit: BoxFit.fill),
  ),
  Doctor(
    name: 'Dr. Mark Johnson',
    speciality: 'Dermatology',
    image: Image.network('assets/images/doctorm.jpg', height: 80, width: 50, fit: BoxFit.fill),
  ),
  Doctor(
    name: 'Dr. Sarah Lee',
    speciality: 'Ophthalmology',
    image: Image.network('assets/images/doctorf.jpg',height: 80, width: 50, fit: BoxFit.fill),
  ),
];
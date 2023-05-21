import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Doctor {
  final String name;
  final String speciality;
  final String experience;
  final String? about;
  final String? email;
  String? availability;
  final String imageUrl; // Store the image URL as a String

  Doctor({
    this.about,
    this.email,
    required this.name,
    required this.speciality,
    required this.experience,
    this.availability,
    required this.imageUrl,
  });

  factory Doctor.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;

    return Doctor(
      about: data['about'],
      email: data['email'],
      name: data['name'],
      speciality: data['speciality'],
      experience: data['experience'],
      availability: data['availability'],
      imageUrl: data['imageUrl'],
    );
  }
}

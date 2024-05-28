import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PrescriptionUploadPage extends StatefulWidget {
  @override
  _PrescriptionUploadPageState createState() => _PrescriptionUploadPageState();
}

class _PrescriptionUploadPageState extends State<PrescriptionUploadPage> {
  File? _prescriptionImage;
  TextEditingController _phoneNumberController = TextEditingController();
  String _phoneNumber = '';

  Future<void> _uploadPrescription() async {
    try {
      final picker = ImagePicker();
      final pickedImage = await picker.pickImage(source: ImageSource.gallery);
      setState(() {
        if (pickedImage != null) {
          _prescriptionImage = File(pickedImage.path);
        }
      });
    } catch (error) {
      // Handle any error that occurred during image picking or setting the state
      print('Error uploading prescription: $error');
    }
  }

  Future<void> _placeOrder() async {
    try {
      _phoneNumber = _phoneNumberController.text.trim();

      if (_prescriptionImage != null) {
        final storage = FirebaseStorage.instance;
        final ref = storage.ref().child('prescriptions/${DateTime.now().millisecondsSinceEpoch}.jpg');
        final uploadTask = ref.putFile(_prescriptionImage!);

        showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            title: Text('Uploading Prescription'),
            content: LinearProgressIndicator(),
          ),
        );

        final snapshot = await uploadTask.whenComplete(() {});

        Navigator.pop(context);

        if (snapshot.state == TaskState.success) {
          final downloadUrl = await snapshot.ref.getDownloadURL();

          // Get the currently logged-in user's email
          User? user = FirebaseAuth.instance.currentUser;
          String? userEmail = user?.email;

          // Store the download URL, phone number, and user's email in Firebase Firestore
          await FirebaseFirestore.instance.collection('orders').add({
            'downloadUrl': downloadUrl,
            'phoneNumber': _phoneNumber,
            'userEmail': userEmail,
          });

          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Order Placed'),
              content: Text('Prescription uploaded successfully!'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    // Perform any other action if needed
                  },
                  child: Text('OK'),
                ),
              ],
            ),
          );
        } else {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Error'),
              content: Text('Failed to upload the prescription image.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    // Perform any other action if needed
                  },
                  child: Text('OK'),
                ),
              ],
            ),
          );
        }
      } else {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('No Prescription Image'),
            content: Text('Please choose a prescription image.'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  // Perform any other action if needed
                },
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
    } catch (error) {
      // Handle any error that occurred during the order placement process
      print('Error placing order: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Order Medicine'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                child: Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Text(
                        'Upload Prescription',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 20.0),
                      ElevatedButton(
                        onPressed: _uploadPrescription,
                        child: Text('Choose Prescription Image'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.yellow[700],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              if (_prescriptionImage != null)
                Card(
                  child: Image.file(
                    _prescriptionImage!,
                    height: 200,
                  ),
                ),
              SizedBox(height: 20.0),
              TextField(
                controller: _phoneNumberController,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: _placeOrder,
                child: Text('Place Order'),
                style: ElevatedButton.styleFrom(
                  primary: Colors.yellow[700],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

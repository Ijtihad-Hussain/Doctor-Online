import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tele_consult/screens/Chat/testMessagingScreen.dart';
import 'package:tele_consult/screens/Chat/video_calling_page.dart';
import 'package:tele_consult/screens/doctorSide/doctorMenu.dart';
import 'package:tele_consult/utils/colors.dart';
import 'package:tele_consult/utils/customTextStyles.dart';
import '../../widgets/apointmentsBox.dart';
import '../../widgets/button.dart';
import '../../widgets/patientCard.dart';
import '../Chat/audio_calling_page.dart';
import 'appointments.dart';
import 'contacts.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class DoctorHome extends StatefulWidget {
  const DoctorHome({Key? key}) : super(key: key);

  @override
  State<DoctorHome> createState() => _DoctorHomeState();
}

class _DoctorHomeState extends State<DoctorHome> {

  bool _isOnline = false;

  @override
  void initState() {
    super.initState();
    // Fetch initial status from Firestore
    _fetchDoctorStatus();
  }

  void _fetchDoctorStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      final userId = currentUser.uid;
      final userDoc = FirebaseFirestore.instance.collection('doctors').doc(userId);
      final userSnapshot = await userDoc.get();
      final status = userSnapshot.data()?['status'];
      setState(() {
        _isOnline = status == 'online';
      });
    }
  }

  void _toggleStatus() async {
    final currentUser = FirebaseAuth.instance.currentUser;
    print(currentUser?.email);
    if (currentUser != null) {
      final email = currentUser.email;
      print(email);
      final newStatus = _isOnline ? 'offline' : 'online';
      final userDoc = FirebaseFirestore.instance.collection('doctors').where('email', isEqualTo: email);

      print('Before update - Current status: ${_isOnline ? 'Online' : 'Offline'}');

      final querySnapshot = await userDoc.get();
      if (querySnapshot.docs.isNotEmpty) {
        final doctorDoc = querySnapshot.docs.first.reference;
        await doctorDoc.update({'status': newStatus});
        setState(() {
          _isOnline = !_isOnline;
        });
        print('After update - New status: ${_isOnline ? 'Online' : 'Offline'}');
      } else {
        print('Doctor document not found');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: kGBlue,
        // elevation: 1,
        title: const Center(child: Text('Welcome Doctor')),
        actions: <Widget>[
          IconButton(
            onPressed: _toggleStatus,
            icon: Icon(_isOnline ? Icons.visibility : Icons.visibility_off),
          ),//IconButton
        ], //<Widget>[]
        leading: IconButton(
          icon: const Icon(Icons.menu),
          tooltip: 'Menu Icon',
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DoctorMenu()),
            );
          },
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Wrap(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Appointments()),
                        );
                      },
                      child: AppointmentsBox(
                        color: kGBlue,
                        icon: Icon(Icons.medication),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => GroupCallScreen()),
                        );
                      },
                      child: AppointmentsBox(
                        color: kGBlue,
                        icon: Icon(Icons.chat),
                        text: 'Online Consultations',
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Upcoming Appointments',
                  style: CustomTextStyles.boldStyle.copyWith(fontSize: 16),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(5.h),
              ),
              FutureBuilder(
                future: getUpcomingAppointments(),
                builder: (BuildContext context,
                    AsyncSnapshot<List<Appointment>> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (!snapshot.hasData) {
                    return Center(child: Text('No upcoming appointments.'));
                  } else {
                    return Column(
                      children: [
                        for (var appointment in snapshot.data!)
                          PatientCard(
                              name: appointment.name, day: appointment.day),
                      ],
                    );
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Button(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Appointments(),
                      ),
                    );
                  },
                  buttonText: 'View All',
                  width: 200,
                  color: kGBlue,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<List<Appointment>> getUpcomingAppointments() async {
    var now = DateTime.now();
    var querySnapshot = await FirebaseFirestore.instance
        .collection('appointments')
        .where('doctorEmail', isEqualTo: FirebaseAuth.instance.currentUser?.email) // Replace 'doctorId' with the actual field name in your Firestore collection
        .where('date', isGreaterThan: now)
        .orderBy('date')
        .limit(4)
        .get();

    List<Appointment> appointments = [];
    for (var documentSnapshot in querySnapshot.docs) {
      var data = documentSnapshot.data();
      var name = data['name'];
      var date = data['date'].toDate();
      var day = date.day;
      appointments.add(Appointment(name: name, date: date, day: day));
    }

    return appointments;
  }
}

class Appointment {
  String name;
  DateTime date;
  int day;

  Appointment({required this.name, required this.date, required this.day});
}

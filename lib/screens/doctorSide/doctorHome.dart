import 'package:flutter/material.dart';
import 'package:tele_consult/screens/doctorSide/doctorMenu.dart';
import 'package:tele_consult/utils/colors.dart';
import 'package:tele_consult/utils/customTextStyles.dart';
import '../../widgets/apointmentsBox.dart';
import '../../widgets/button.dart';
import '../../widgets/patientCard.dart';
import 'appointments.dart';
import 'contacts.dart';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DoctorHome extends StatelessWidget {
  const DoctorHome({Key? key}) : super(key: key);

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
            icon: const Icon(Icons.notifications_sharp),
            tooltip: 'Notification Icon',
            onPressed: () {},
          ), //IconButton
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/doctorm.jpg'),
              radius: 22,
            ),
          ), //IconButton
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
                        MaterialPageRoute(builder: (context) => Contacts()),
                      );
                    },
                    child: AppointmentsBox(
                      color: kGBlue,
                      icon: Icon(Icons.chat),
                      text: 'Chats',
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
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Text(
                      'Name',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 100),
                    child: Text(
                      'Date',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
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
    );
  }

  Future<List<Appointment>> getUpcomingAppointments() async {
    var now = DateTime.now();
    var querySnapshot = await FirebaseFirestore.instance
        .collection('appointments')
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

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

// class Appointment {
//   final String id;
//   final String doctorName;
//   final String specialization;
//   final String date;
//   final Duration duration;
//
//   Appointment({
//     required this.id,
//     required this.doctorName,
//     required this.specialization,
//     required this.date,
//     required this.duration,
//   });
// }

class MyAppointments extends StatefulWidget {
  const MyAppointments({Key? key}) : super(key: key);

  @override
  _MyAppointmentsState createState() => _MyAppointmentsState();
}

class _MyAppointmentsState extends State<MyAppointments> {
  final currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appointments'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('appointments')
            .where('userEmail', isEqualTo: currentUser?.email)
            .snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Center(child: Text('No appointments found.'));
          }
          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (BuildContext context, int index) {
              DocumentSnapshot appointment = snapshot.data!.docs[index];
              String name = appointment['doctorName'];
              String date = appointment['selectedDate'];
              return Card(
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text(
                      name != null && name.isNotEmpty ? name[0] : '',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  title: Text(name ?? ''),
                  subtitle: Text(date.toString()),
                  onTap: () {
                    // Navigate to appointment details page
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}

// class AppointmentCard extends StatelessWidget {
//   final Appointment appointment;
//
//   const AppointmentCard({Key? key, required this.appointment})
//       : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final currentUser = FirebaseAuth.instance.currentUser;
//
//     if (currentUser == null) {
//       // User not logged in
//       return Scaffold(
//         appBar: AppBar(
//           title: const Text('My Appointments'),
//         ),
//         body: const Center(
//           child: Text('Please log in to view appointments.'),
//         ),
//       );
//     } else {
//       // User logged in, fetch appointments
//       return StreamBuilder<QuerySnapshot>(
//         stream: FirebaseFirestore.instance
//             .collection('appointments')
//             .where('userEmail', isEqualTo: currentUser.email)
//             .snapshots(),
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             return Scaffold(
//               appBar: AppBar(
//                 title: const Text('My Appointments'),
//               ),
//               body: const Center(
//                 child: Text('Error fetching appointments.'),
//               ),
//             );
//           }
//
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Scaffold(
//               appBar: AppBar(
//                 title: const Text('My Appointments'),
//               ),
//               body: const Center(
//                 child: CircularProgressIndicator(),
//               ),
//             );
//           }
//
//           final appointments = snapshot.data!.docs.map((doc) {
//             final data = doc.data() as Map<String, dynamic>;
//             return Appointment(
//               id: doc.id,
//               doctorName: data['doctorName'] ?? '',
//               specialization: data['specialization'] ?? '',
//               date: data['selectedDate'],
//               duration: Duration(minutes: data['duration'] ?? 0),
//             );
//           }).toList();
//
//           return Scaffold(
//             appBar: AppBar(
//               title: const Text('My Appointments'),
//             ),
//             body: ListView.builder(
//               itemCount: appointments.length,
//               itemBuilder: (context, index) {
//                 final appointment = appointments[index];
//                 return AppointmentCard(
//                   appointment: appointment,
//                 );
//               },
//             ),
//           );
//         },
//       );
//     }
//   }
// }

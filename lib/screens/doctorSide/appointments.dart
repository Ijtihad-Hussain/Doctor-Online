import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Appointments extends StatefulWidget {
  @override
  _AppointmentsState createState() => _AppointmentsState();
}

class _AppointmentsState extends State<Appointments> {
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
            .where('doctorEmail', isEqualTo: currentUser?.email)
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
              String name = appointment['name'];
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




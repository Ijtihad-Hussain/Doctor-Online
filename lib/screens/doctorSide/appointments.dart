import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Appointments extends StatefulWidget {
  @override
  _AppointmentsState createState() => _AppointmentsState();
}

class _AppointmentsState extends State<Appointments> {
  // List<Appointment> appointments = [
  //   Appointment('John Doe', DateTime.now().add(Duration(days: 1))),
  //   Appointment('Jane Smith', DateTime.now().add(Duration(days: 2))),
  //   Appointment('Bob Johnson', DateTime.now().add(Duration(days: 3))),
  // ]; // Add more appointments as needed  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Appointments'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('appointments').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else {
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
                        name[0],
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    title: Text(name),
                    subtitle: Text(date.toString()),
                    onTap: () {
                      // Navigate to appointment details page
                    },
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}



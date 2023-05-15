import 'package:flutter/material.dart';

class Appointment {
  final String id;
  final String doctorName;
  final String specialization;
  final DateTime date;
  final Duration duration;

  Appointment({
    required this.id,
    required this.doctorName,
    required this.specialization,
    required this.date,
    required this.duration,
  });
}

class MyAppointments extends StatefulWidget {
  const MyAppointments({Key? key}) : super(key: key);

  @override
  _MyAppointmentsState createState() => _MyAppointmentsState();
}

class _MyAppointmentsState extends State<MyAppointments> {
  final List<Appointment> _appointments = [
    Appointment(
      id: '1',
      doctorName: 'Dr. John Doe',
      specialization: 'Cardiologist',
      date: DateTime(2022, 05, 15, 15, 30),
      duration: const Duration(hours: 1),
    ),
    Appointment(
      id: '2',
      doctorName: 'Dr. Jane Smith',
      specialization: 'Dermatologist',
      date: DateTime(2022, 05, 17, 11, 00),
      duration: const Duration(hours: 1, minutes: 30),
    ),
    Appointment(
      id: '3',
      doctorName: 'Dr. David Lee',
      specialization: 'Ophthalmologist',
      date: DateTime(2022, 05, 19, 9, 45),
      duration: const Duration(hours: 2),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Appointments'),
      ),
      body: ListView.builder(
        itemCount: _appointments.length,
        itemBuilder: (context, index) {
          final appointment = _appointments[index];
          return AppointmentCard(
            appointment: appointment,
          );
        },
      ),
    );
  }
}

class AppointmentCard extends StatelessWidget {
  final Appointment appointment;

  const AppointmentCard({Key? key, required this.appointment})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(appointment.doctorName),
        subtitle: Text('${appointment.specialization}\n'
            '${appointment.date.toString()}\n'
            '${appointment.duration.inMinutes} minutes'),
      ),
    );
  }
}

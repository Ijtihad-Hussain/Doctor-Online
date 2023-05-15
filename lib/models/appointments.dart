class Appointment {
  String patientName;
  String dateTime;
  String doctorName;

  Appointment({required this.patientName, required this.dateTime, required this.doctorName});
}

final List<Appointment> appointments = [
  Appointment(patientName: 'John Doe', dateTime: '2022-05-01 10:00', doctorName: 'Dr. Smith'),
  Appointment(patientName: 'Jane Doe', dateTime: '2022-05-02 11:00', doctorName: 'Dr. Johnson'),
  Appointment(patientName: 'Jim Brown', dateTime: '2022-05-03 12:00', doctorName: 'Dr. Brown'),
  Appointment(patientName: 'Julie Smith', dateTime: '2022-05-04 13:00', doctorName: 'Dr. Williams'),
  Appointment(patientName: 'Jim Wilson', dateTime: '2022-05-05 14:00', doctorName: 'Dr. Wilson'),
];

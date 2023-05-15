class Patient {
  String name;
  String email;
  String phoneNumber;

  Patient({required this.name, required this.email, required this.phoneNumber});
}

final List<Patient> patients = [
  Patient(name: 'John Doe', email: 'johndoe@email.com', phoneNumber: '555-555-5555'),
  Patient(name: 'Jane Doe', email: 'janedoe@email.com', phoneNumber: '555-555-5556'),
  Patient(name: 'Jim Brown', email: 'jimbrown@email.com', phoneNumber: '555-555-5557'),
  Patient(name: 'Julie Smith', email: 'juliesmith@email.com', phoneNumber: '555-555-5558'),
  Patient(name: 'Jim Wilson', email: 'jimwilson@email.com', phoneNumber: '555-555-5559'),
];
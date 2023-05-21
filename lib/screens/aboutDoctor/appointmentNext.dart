import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:calendar_builder/calendar_builder.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:tele_consult/screens/User/paymentPage.dart';
import 'package:tele_consult/screens/aboutDoctor/thankYouScreen.dart';
import 'package:tele_consult/utils/colors.dart';
import '../../widgets/alarmTimeCard.dart';
import '../../widgets/button.dart';
import '../../widgets/pageDecoration.dart';
import '../../widgets/timeCard.dart';
import 'package:intl/intl.dart';

class AppointmentNext extends StatefulWidget {
  final String name;
  final int age;
  final String gender;
  final String mobileNumber;
  final String doctorName;
  final String doctorEmail;

  const AppointmentNext({
    required this.name,
    required this.age,
    required this.gender,
    required this.mobileNumber,
    required this.doctorName,
    required this.doctorEmail,
  });

  @override
  State<AppointmentNext> createState() => _AppointmentNextState();
}

class _AppointmentNextState extends State<AppointmentNext> {

  String _selectedAlarmTime = '';

  void _handleSelectTime(String time) {
    setState(() {
      _selectedAlarmTime = time;
    });
  }

  int _selectedTimeIndex = 0;

  String? _selectedTime;

  void _selectCard(int index) {
    setState(() {
      _selectedTimeIndex = index;
      _selectedTime = ''; // Reset selected time when date is changed
    });
  }

  void _selectTimeCard(String time) {
    setState(() {
      _selectedTime = time;
    });
  }

  List<Widget> _getAvailableTimeCards() {
    // Define a list of available times for each date
    final List<List<String>> availableTimes = [      ['9:00 AM', '10:00 AM', '11:00 AM', '12:00 PM'],
      ['1:00 PM', '2:00 PM', '3:00 PM', '4:00 PM'],
      ['9:30 AM', '10:30 AM', '11:30 AM', '12:30 PM'],
      ['1:30 PM', '2:30 PM', '3:30 PM', '4:30 PM'],
      ['5:00 PM', '6:00 PM', '7:00 PM', '8:00 PM']
    ];

    // Get the available times for the selected date
    List<String> times = availableTimes[_selectedTimeIndex];

    // Create a list of TimeCard widgets for the available times
    return times.map((time) {
      return GestureDetector(
        onTap: () => _selectTimeCard(time),
        child: TimeCard(
          height: 40,
          width: 60,
          time: time,
          color: _selectedTime == time ? Colors.blue : null,
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    String? myDay(int i) {
      final now = DateTime.now();
      final dayToday = DateTime(now.year, now.month, now.day + i);
      String? day = DateFormat('EEEE').format(dayToday);
      return day;
    }
    String? myMonth(int i) {
      final now = DateTime.now();
      final day = DateTime(now.year, now.month, now.day + i);
      String? month = DateFormat('MMM').format(day);
      return month;
    }
    String? myDate(int i) {
      final now = DateTime.now();
      final day = DateTime(now.year, now.month, now.day + i);
      String? date = DateFormat('dd').format(day);
      return date;
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appointment'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20, right: 100),
              child: Text('Select date'),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => _selectCard(0),
                    child: TimeCard(
                      height: 45,
                      width: 70,
                      color: _selectedTimeIndex == 0 ? Colors.blue : null,
                      time: '${myDay(0)}\n${myMonth(0)} ${myDate(0)}',
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _selectCard(1),
                    child: TimeCard(
                      height: 45,
                      width: 70,
                      color: _selectedTimeIndex == 1 ? Colors.blue : null,
                      time: '${myDay(1)}\n${myMonth(1)} ${myDate(1)}',
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _selectCard(2),
                    child: TimeCard(
                      height: 45,
                      width: 70,
                      color: _selectedTimeIndex == 2 ? Colors.blue : null,
                      time: '${myDay(2)}\n${myMonth(2)} ${myDate(2)}',
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _selectCard(3),
                    child: TimeCard(
                      height: 45,
                      width: 70,
                      color: _selectedTimeIndex == 3 ? Colors.blue : null,
                      time: '${myDay(3)}\n${myMonth(3)} ${myDate(3)}',
                    ),
                  ),
                  GestureDetector(
                    onTap: () => _selectCard(4),
                    child: TimeCard(
                      height: 45,
                      width: 70,
                      color: _selectedTimeIndex == 4 ? Colors.blue : null,
                      time: '${myDay(14)}\n${myMonth(14)} ${myDate(14)}',
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20, right: 100),
              child: Text('Available time'),
            ),
            Wrap(
              children: _getAvailableTimeCards(),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20, right: 100),
              child: Text('Remind me before'),
            ),
            Wrap(
              children: [
                AlarmTimeCard(
                  height: 40,
                  width: 60,
                  time: '40 Mins',
                  isSelected: _selectedAlarmTime == '40 Mins',
                  onSelect: () {
                    setState(() {
                      _selectedAlarmTime = '40 Mins';
                    });
                  },
                ),
                AlarmTimeCard(
                  height: 40,
                  width: 60,
                  time: '30 Mins',
                  isSelected: _selectedAlarmTime == '30 Mins',
                  onSelect: () {
                    setState(() {
                      _selectedAlarmTime = '30 Mins';
                    });
                  },
                ),
                AlarmTimeCard(
                  height: 40,
                  width: 60,
                  time: '25 Mins',
                  isSelected: _selectedAlarmTime == '25 Mins',
                  onSelect: () {
                    setState(() {
                      _selectedAlarmTime = '25 Mins';
                    });
                  },
                ),
                AlarmTimeCard(
                  height: 40,
                  width: 60,
                  time: '20 Mins',
                  isSelected: _selectedAlarmTime == '20 Mins',
                  onSelect: () {
                    setState(() {
                      _selectedAlarmTime = '20 Mins';
                    });
                  },
                ),
                AlarmTimeCard(
                  height: 40,
                  width: 60,
                  time: '15 Mins',
                  isSelected: _selectedAlarmTime == '15 Mins',
                  onSelect: () {
                    setState(() {
                      _selectedAlarmTime = '15 Mins';
                    });
                  },
                ),
                AlarmTimeCard(
                  height: 40,
                  width: 60,
                  time: '10 Mins',
                  isSelected: _selectedAlarmTime == '10 Mins',
                  onSelect: () {
                    setState(() {
                      _selectedAlarmTime = '10 Mins';
                    });
                  },
                ),
              ],
            ),
            Button(
              buttonText: 'Confirm',
              onPressed: () async {
                String name = widget.name;
                int age = widget.age;
                String gender = widget.gender;
                String mobileNumber = widget.mobileNumber;
                String doctorName = widget.doctorName;
                String doctorEmail = widget.doctorEmail;
                String selectedTime = _selectedTime ?? '';
                String selectedDate = '${myDay(_selectedTimeIndex)}, ${myMonth(_selectedTimeIndex)} ${myDate(_selectedTimeIndex)}';

                // Add the appointment to Firestore
                try {
                  final CollectionReference appointmentsCollection =
                  FirebaseFirestore.instance.collection('appointments');

                  await appointmentsCollection.add({
                    'name': name,
                    'age': age,
                    'gender': gender,
                    'mobileNumber': mobileNumber,
                    'doctorName': doctorName,
                    'doctorEmail': doctorEmail,
                    'selectedTime': selectedTime,
                    'selectedDate': selectedDate,
                    'selectedAlarmTime': _selectedAlarmTime,
                  });

                  print('Appointment added to Firestore');
                } catch (e) {
                  print('Failed to add appointment: $e');
                }

                // Navigate to the PaymentPage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PaymentPage()),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PatientCard extends StatefulWidget {
  String? name;
  String? time;
  int? day;


  PatientCard({this.name,this.day,this.time});

  @override
  State<PatientCard> createState() => _PatientCardState();
}

class _PatientCardState extends State<PatientCard> {
  @override
  Widget build(BuildContext context) {

    String? myDay(int i){
      final now = DateTime.now();
      final dayToday = DateTime(now.year, now.month, now.day + i);
      String? day = DateFormat('EE').format(dayToday);
      return day;
    }
    String? myMonth(int i){
      final now = DateTime.now();
      final day = DateTime(now.year, now.month, now.day + i);
      String? month = DateFormat('MMM').format(day);
      return month;
    }

    String? myDate(int i){
      final now = DateTime.now();
      final day = DateTime(now.year, now.month, now.day + i);
      String? date = DateFormat('dd').format(day);
      return date;
    }

    return Container(
      height: 40,
      width: double.infinity,
      color: Colors.transparent,
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/abuzar-xheikh.jpg'),
            radius: 12,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(widget.name ?? 'Abdur Rehman',
              style: TextStyle(fontSize: 12),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Text('${myDay(widget.day ?? 0)}, ${myMonth(widget.day ?? 0)} ${myDate(widget.day ?? 0)}',
              style: TextStyle(fontSize: 12),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Text(widget.time ?? '09:15-09:45am',
              style: TextStyle(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}

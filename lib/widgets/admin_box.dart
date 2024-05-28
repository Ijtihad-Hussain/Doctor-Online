import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AdminBox extends StatefulWidget {
  final String? title;
  final double? number;
  final Color? color;

  const AdminBox({Key? key,this.number, this.title, this.color}) : super(key: key);

  @override
  State<AdminBox> createState() => _AdminBoxState();
}

class _AdminBoxState extends State<AdminBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 18.h,
      width: 20.w,
      color: widget.color ?? Colors.orangeAccent,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(widget.title ?? 'Appointments'),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(widget.number.toString() ,style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
          ),
        ],
      ),
    );
  }
}

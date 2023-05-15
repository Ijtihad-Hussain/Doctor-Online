import 'package:flutter/material.dart';
import 'package:tele_consult/utils/colors.dart';

class ContactBox extends StatefulWidget {
  Color? color;
  String? name;
  String? lastMessage;

  ContactBox({this.color,this.name,this.lastMessage, required avatarUrl});
  @override
  State<ContactBox> createState() => _ContactBoxState();
}

class _ContactBoxState extends State<ContactBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      color: widget.color ?? Colors.transparent,
      child: Row(
        children: [
          const CircleAvatar(
            backgroundImage: AssetImage('assets/images/abuzar-xheikh.jpg'),
            radius: 18,
          ),
          Column(
            children: [
              Padding(
              padding: const EdgeInsets.only(left: 10,top: 7),
              child: Text(widget.name ?? 'Abdur Rehman',style: TextStyle(fontWeight: FontWeight.bold),),
            ),
              Padding(
                padding: const EdgeInsets.only(left: 10,top: 4),
                child: Text(widget.lastMessage ?? 'Good morning, did you sleep well?',style: TextStyle(fontSize: 10),),
              ),
            ],
          ),
          Spacer(),
          Text('6:54pm',style: TextStyle(color: kBlue,fontSize: 10),),
        ],
      ),
    );
  }
}

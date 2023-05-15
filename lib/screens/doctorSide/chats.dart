import 'package:flutter/material.dart';
import 'package:tele_consult/widgets/customTextFormField.dart';

import '../../utils/colors.dart';

class Chats extends StatefulWidget {
  const Chats({Key? key}) : super(key: key);

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kGBlue,
        // elevation: 1,
        title: const Center(child: Text('Abdur Rehman')),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.call),
            tooltip: 'Call Icon',
            onPressed: () {},
          ), //IconButton
          IconButton(
            icon: const Icon(Icons.videocam_rounded),
            tooltip: 'Notification Icon',
            onPressed: () {},
          ),//IconButton
        ], //<Widget>[]
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextFormField(
                hintText: 'today',
                width: 80,
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: CustomTextFormField(
                  color: kLightBlue,
                  hintText: 'message from patient',
                  // width: 80,
                  // height: 30,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 50),
                child: CustomTextFormField(
                  color: Colors.grey,
                  hintText: 'message from patient',
                  // width: 80,
                  // height: 30,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50),
                child: CustomTextFormField(
                  color: kLightBlue,
                  hintText: 'message from doctor',
                  // width: 80,
                  // height: 30,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 50),
                child: CustomTextFormField(
                  color: Colors.grey,
                  hintText: 'message from patient',
                  // width: 80,
                  // height: 30,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 160),
                child: CustomTextFormField(
                  color: kGBlue,
                  hintText: 'type a message',
                  prefix: IconButton(icon: Icon(Icons.camera_alt,color: Colors.black54,), onPressed: () {  },),
                  suffixIcon: IconButton(onPressed: () {  }, icon: Icon(Icons.attach_file),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:tele_consult/utils/colors.dart';
import 'package:tele_consult/widgets/button.dart';
import 'package:tele_consult/widgets/custom_text_form_field.dart';

import '../../widgets/box_container.dart';
import '../../widgets/page_decoration.dart';
import 'all_records.dart';

class AddRecord extends StatelessWidget {
  const AddRecord({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.black38,
        ),
        title: const Text(
          'Add Record',
          style: TextStyle(color: Colors.black38),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: PageDecoration.pageDecoration,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 100),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Container(
                      height: 100,
                      width: 90,
                      decoration: BoxDecoration(
                        color: kLightGreen,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Image.asset('assets/images/abuzar-xheikh.jpg'),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => _buildUploadDialog(context),
                      );
                    },
                    child: Container(
                      height: 100,
                      width: 90,
                      decoration: BoxDecoration(
                        color: kLightGreen,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: const [
                          Padding(
                            padding: EdgeInsets.all(14.0),
                            child: Icon(Icons.add_a_photo),
                          ),
                          Text('add image'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 40),
                child: Container(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.blueGrey
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Container(
                          height: 80,
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                            color: Colors.white
                          ),
                          child: CustomTextFormField(
                            hintText: 'Record For',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(3, 0, 3, 0),
                        child: Container(
                          height: 80,
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                              color: Colors.white
                          ),
                          child: CustomTextFormField(
                            hintText: 'Record Type',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Container(
                          height: 80,
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                              color: Colors.white
                          ),
                          child: CustomTextFormField(
                            hintText: 'Date',
                          ),
                        ),
                      ),
                      Button(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AllRecords()),
                          );
                        },
                        width: 220,
                        buttonText: 'Upload record',
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


Widget _buildUploadDialog(BuildContext context) {
  return AlertDialog(
    title: const Text('Add an image'),
    content: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          children: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.camera_alt_outlined),
            ),
            Text("take a photo"),
          ],
        ),
        Row(
          children: const [
            Padding(
              padding: EdgeInsets.only(left: 8, right: 8),
              child: Icon(Icons.insert_photo_sharp),
            ),
            Text('upload from gallery'),
          ],
        ),
        Row(
          children: const [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.insert_drive_file_sharp),
            ),
            Text('upload files'),
          ],
        ),
      ],
    ),
    actions: <Widget>[
      TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text('Submit'),
      ),
    ],
  );
}
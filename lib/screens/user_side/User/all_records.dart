import 'package:flutter/material.dart';
import 'package:tele_consult/widgets/box_container.dart';
import 'package:tele_consult/widgets/button.dart';
import 'package:tele_consult/widgets/custom_text_form_field.dart';

import '../../widgets/page_decoration.dart';
import '../../widgets/record_box.dart';
import 'add_record.dart';

class AllRecords extends StatelessWidget {
  const AllRecords({Key? key}) : super(key: key);

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
          'All Records',
          style: TextStyle(color: Colors.black38),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: PageDecoration.pageDecoration,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 120, bottom: 20),
                child: RecordBox(
                  patientName: 'Abdullah Mamun',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: RecordBox(
                  buttonText: '28\nOCT',
                  patientName: 'Shruti Kedia',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: RecordBox(
                  buttonText: '29\nNOV',
                  patientName: 'Shruti Kedia',
                ),
              ),
              Button(
                width: 200,
                buttonText: 'Add a record',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddRecord()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

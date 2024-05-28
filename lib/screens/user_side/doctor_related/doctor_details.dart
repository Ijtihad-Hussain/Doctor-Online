import 'package:flutter/material.dart';
import 'package:tele_consult/utils/custom_tex_styles.dart';

import '../../../widgets/button.dart';
import '../../../widgets/custom_text_form_field.dart';
import '../../../widgets/doctor_book_card.dart';
import '../../../widgets/page_decoration.dart';

class DoctorDetails extends StatelessWidget {
  const DoctorDetails({Key? key}) : super(key: key);

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
        title: const Padding(
          padding: EdgeInsets.only(top: 40, left: 20),
          child: Text(
            'Doctor Details',
            style: TextStyle(
                color: Colors.black38,
                fontWeight: FontWeight.bold,
                fontSize: 24),
          ),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: PageDecoration.pageDecoration,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 120),
        child: SingleChildScrollView(
          child: Column(
            children: [
              DoctorBookCard(
                name: 'Abdur Rehman',
                specialization: 'Cardiologist',
                experience: '7 years experience',
                availability: '12:00 PM tomorrow',
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        _buildLogoutDialog(context),
                  );
                },
                // feePerHour: '£28 28/hour',
              ),
              Padding(
                padding: const EdgeInsets.only(top: 48),
                child: Container(
                  height: 100,
                  width: 350,
                  decoration: BoxDecoration(
                    color: Colors.white54,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    border: Border.all(
                      color: Colors.white
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Container(
                          height: 60,
                          width: 100,
                          decoration: const BoxDecoration(
                            color: Colors.white
                          ),
                          child: Column(
                            children: const [
                              Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Text(
                                  'Reviews',
                                  style: CustomTextStyles.boldStyle,
                                ),
                              ),
                              Text(
                                  '100+'
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Container(
                          height: 60,
                          width: 100,
                          decoration: const BoxDecoration(
                              color: Colors.white
                          ),
                          child: Column(
                            children: const [
                              Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Text(
                                  'Experience',
                                  style: CustomTextStyles.boldStyle,
                                ),
                              ),
                              Text(
                                  '8 years'
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12),
                        child: Container(
                          height: 60,
                          width: 100,
                          decoration: const BoxDecoration(
                              color: Colors.white
                          ),
                          child: Column(
                            children: const [
                              Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Text(
                                  'Ratings',
                                  style: CustomTextStyles.boldStyle,
                                ),
                              ),
                              Text(
                                  '4.9'
                              ),
                            ],
                          ),
                        ),
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

Widget _buildLogoutDialog(BuildContext context) {
  return AlertDialog(
    title: const Text('Enter Details'),
    content: Container(
      height: 180,
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 12),
            child: Text(
              'Patient Name',
              style: TextStyle(
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          CustomTextFormField(
            width: 220,
            height: 40,
            hintText: 'Name',
            color: Colors.grey,
            isTextAlignCenter: true,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 12),
            child: Text(
              'Mobile Number',
              style: TextStyle(
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          CustomTextFormField(
            width: 220,
            height: 40,
            hintText: '+17281787237',
            color: Colors.grey,
            isTextAlignCenter: true,
          ),
        ],
      ),
    ),
    actions: <Widget>[
      Button(
        buttonText: 'Book',
        onPressed: () {},
      ),
    ],
  );
}
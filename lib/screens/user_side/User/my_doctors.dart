import 'package:flutter/material.dart';

import '../../widgets/custom_text_form_field.dart';
import '../../widgets/doctor_book_card.dart';
import '../../widgets/page_decoration.dart';
import '../aboutDoctor/select_doctor_time.dart';

class MyDoctors extends StatelessWidget {
  const MyDoctors({Key? key}) : super(key: key);

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
          'My Doctors',
          style: TextStyle(color: Colors.black38),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: PageDecoration.pageDecoration,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 80),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextFormField(
                hintText: 'Dentist',
                keyBoardType: TextInputType.text,
              ),
              const SizedBox(
                height: 36,
              ),
              DoctorBookCard(
                name: 'Dr. Shruti Kedia',
                specialization: 'Dentist',
                experience: '7 years experience',
                availability: '12:00 AM tomorrow',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SelectDoctorTime()),
                  );
                },
              ),
              const SizedBox(
                height: 36,
              ),
              DoctorBookCard(
                  availability: '12:00 AM tomorrow',
                  doctorpicture: Image.asset(
                    'assets/images/ly1.png',
                    width: 80,
                  )),
              const SizedBox(
                height: 36,
              ),
              DoctorBookCard(
                  availability: '12:00 AM tomorrow',
                  doctorpicture: Image.asset(
                    'assets/images/gy1.png',
                    width: 80,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

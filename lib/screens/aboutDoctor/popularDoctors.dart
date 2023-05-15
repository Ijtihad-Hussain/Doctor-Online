import 'package:flutter/material.dart';

import '../../widgets/doctorCardHorizontal.dart';
import '../../widgets/doctorCardVertical.dart';
import '../../widgets/pageDecoration.dart';

class PopularDoctors extends StatelessWidget {
  const PopularDoctors({Key? key}) : super(key: key);

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
            'Popular Doctors',
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
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 120),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    DoctorCardVertical(
                      doctorpicture: 'assets/images/female-doctor-smile.jpg',
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    DoctorCardVertical(),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 24,right: 120,bottom: 14),
                child: Text(
                  'Category',
                  style: TextStyle(
                      color: Colors.black38,
                      fontWeight: FontWeight.bold,
                      fontSize: 24
                  ),
                ),
              ),
              DoctorCardHorizontal(
                belowName: 'Dentist',
              ),
              const SizedBox(
                height: 12,
              ),
              DoctorCardHorizontal(
                belowName: 'Dentist',
              ),
              const SizedBox(
                height: 12,
              ),
              DoctorCardHorizontal(
                belowName: 'Dentist',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
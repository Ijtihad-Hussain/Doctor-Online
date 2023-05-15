import 'package:flutter/material.dart';
import 'package:tele_consult/screens/aboutDoctor/selectTime.dart';

import '../../utils/colors.dart';
import '../../widgets/doctorCardHorizontal.dart';
import '../../widgets/pageDecoration.dart';

class SelectDoctorTime extends StatelessWidget {
  const SelectDoctorTime({Key? key}) : super(key: key);

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
          'Select Time',
          style: TextStyle(color: Colors.black38, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: PageDecoration.pageDecoration,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 140),
        child: SingleChildScrollView(
          child: Column(
            children: [
              DoctorCardHorizontal(),
              const SizedBox(
                height: 40,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      height: 75,
                      width: 150,
                      decoration: BoxDecoration(
                        color: kLightBlue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Column(
                          children: const [
                            Padding(
                              padding: EdgeInsets.fromLTRB(8, 12, 8, 8),
                              child: Text(
                                'Today, 4 Nov',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ),
                            Text(
                              'no slots available',
                              style: TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Container(
                      height: 75,
                      width: 150,
                      decoration: BoxDecoration(
                        color: kLightBlue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Column(
                          children: const [
                            Padding(
                              padding: EdgeInsets.fromLTRB(8, 12, 8, 8),
                              child: Text(
                                'Tomorrow, 5 Nov',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ),
                            Text(
                              '7 slots available',
                              style: TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    Container(
                      height: 75,
                      width: 150,
                      decoration: BoxDecoration(
                        color: kLightBlue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Column(
                          children: const [
                            Padding(
                              padding: EdgeInsets.fromLTRB(8, 12, 8, 8),
                              child: Text(
                                'Monday, 7 Nov',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                            ),
                            Text(
                              '10 slots available',
                              style: TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                'Today, 4 Nov',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              const Text(
                'no slots available',
                style: TextStyle(fontSize: 10),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                height: 60,
                width: 330,
                decoration: BoxDecoration(
                  color: kLightBlue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SelectTime()),
                      );
                    },
                    child: const Text(
                      'Next available on Sat, 5 Nov',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              const Text(
                'Or',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                height: 60,
                width: 330,
                decoration: BoxDecoration(
                  color: kLightBlue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    'Contact Clinic',
                    style: TextStyle(fontSize: 18),
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

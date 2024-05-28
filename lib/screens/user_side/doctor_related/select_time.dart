import 'package:flutter/material.dart';

import '../../../widgets/doctor_card_horizontal.dart';
import '../../../widgets/page_decoration.dart';

class SelectTime extends StatelessWidget {
  const SelectTime({Key? key}) : super(key: key);

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
              DoctorCardHorizontal(
                doctorpicture: Image.asset(
                  'assets/images/ly1.png',
                  width: 60,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SlotsDayCard(),
                    SlotsDayCard(
                      day: 'Tomorrow, 5 Nov',
                      slots: '7 slots available',
                    ),
                    SlotsDayCard(
                      day: 'Monday, 7 Nov',
                      slots: '10 slots available',
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
              const Padding(
                padding: EdgeInsets.only(top: 12, right: 250),
                child: Text(
                  'Afternoon slots',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
              ),
              Wrap(
                children: [
                  TimeCard(
                    time: '1:00 PM',
                  ),
                  TimeCard(
                    time: '1:30 PM',
                  ),
                  TimeCard(
                    time: '2:00 PM',
                  ),
                  TimeCard(
                    time: '2:30 PM',
                  ),
                  TimeCard(
                    time: '3:00 PM',
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              const Padding(
                padding: EdgeInsets.only(top: 12, right: 250),
                child: Text(
                  'Evening slots',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 10,
                  ),
                ),
              ),
              Wrap(
                children: [
                  TimeCard(
                    time: '5:00 PM',
                  ),
                  TimeCard(
                    time: '5:30 PM',
                  ),
                  TimeCard(
                    time: '6:00 PM',
                  ),
                  TimeCard(
                    time: '6:30 PM',
                  ),
                  TimeCard(
                    time: '7:00 PM',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
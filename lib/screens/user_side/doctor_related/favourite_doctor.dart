import 'package:flutter/material.dart';

import '../../../widgets/doctor_card_circular.dart';
import '../../../widgets/page_decoration.dart';

class FavouriteDoctor extends StatelessWidget {

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
          padding: EdgeInsets.only(top: 12, left: 20),
          child: Text(
            'Favourite Doctors',
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
        padding: const EdgeInsets.only(top: 100),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Wrap(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, '/doctor-details');
                        },
                        child: DoctorCardCircular(
                          doctorpicture: const AssetImage(
                            'assets/images/doctorm.jpg',
                          ),
                          name: 'Name 1',
                          belowName: 'Dentist',
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DoctorCardCircular(
                      doctorpicture: const AssetImage(
                          'assets/images/female-doctor-smile.jpg'
                      ),
                      name: 'name 2',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DoctorCardCircular(
                      name: 'name 3',
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DoctorCardCircular(
                      name: 'name 4',
                    ),
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

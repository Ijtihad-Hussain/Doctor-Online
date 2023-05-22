import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tele_consult/screens/User/contacts.dart';
import 'package:tele_consult/screens/User/myAppointmentsScreen.dart';
import 'package:tele_consult/screens/aboutDoctor/popularDoctors.dart';
import 'package:tele_consult/screens/askDoctorPage.dart';
import 'package:tele_consult/screens/departments.dart';
import 'package:tele_consult/screens/diagnosticTests.dart';
import 'package:tele_consult/screens/emergencyDoctorPage.dart';
import 'package:tele_consult/widgets/doctorCardVertical.dart';
import 'package:tele_consult/widgets/pageDecoration.dart';
import '../models/doctor.dart';
import '../utils/colors.dart';
import '../widgets/button.dart';
import 'aboutDoctor/findDoctors.dart';
import 'User/menu.dart';
import 'doctorSide/contacts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Icon customIcon = const Icon(Icons.search);

  List<Widget> pages = [
    Home(),
    MyAppointments(),
    Contacts(),
    FindDoctors(),
  ];

  int myCurrentIndex = 0;
  void onItemTap(int index) {
    setState(() {
      myCurrentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: myCurrentIndex,
        onTap: onItemTap,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.access_time_filled),
            label: "My Appointments",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: "Chats",
          ),
        ],
      ),
      body: pages[myCurrentIndex],
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: kGBlue,
          // elevation: 1,
          title: const Center(child: Text('Doctor Online')),
          actions: <Widget>[], //<Widget>[]
          leading: IconButton(
            icon: const Icon(Icons.menu),
            tooltip: 'Menu Icon',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Menu()),
              );
            },
          ),
        ),
        // drawer: ,
        body: Center(
          child: Container(
            height: MediaQuery
                .of(context)
                .size
                .height,
            width: MediaQuery
                .of(context)
                .size
                .width,
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.w),
            decoration: PageDecoration.pageDecoration,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10.h, bottom: 20.h),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(12.w),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Departments()),
                                );
                              },
                              child: Container(
                                width: 150.w,
                                height: 120.h,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(12.r)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 4.r,
                                      offset: Offset(4.w, 8.w), // Shadow position
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(8.w),
                                          child: Image.asset(
                                            'assets/images/book-appointment.png',
                                            height: 36.h,
                                          ),
                                        ),
                                        const Text(
                                          'Find And Book \n Appointment',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: kBlue),
                                        ),
                                      ],
                                    ),
                                    Button(
                                      width: 130.w,
                                      buttonText: 'Book Appointment',
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Departments()),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(12.w),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Departments()),
                                );
                              },
                              child: Container(
                                width: 150.w,
                                height: 120.h,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(12.r)),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 4.r,
                                      offset: Offset(4.w, 8.w), // Shadow position
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.all(8.w),
                                          child: Image.asset(
                                            'assets/images/call.png',
                                            height: 36.h,
                                          ),
                                        ),
                                        const Text(
                                          'Talk To Doctor \n       Online',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: kBlue),
                                        ),
                                      ],
                                    ),
                                    Button(
                                      width: 130.w,
                                      buttonText: 'Video Consultation',
                                      color: Colors.redAccent,
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Departments()),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          'Popular Doctors',
                          style: TextStyle(
                            color: Colors.black54,
                            fontFamily: 'Rubik',
                            fontWeight: FontWeight.w600,
                            fontSize: 18.sp,
                          ),
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('doctors')
                              .where('experience',
                              isGreaterThanOrEqualTo: '5 years') // Adjust the comparison value as per your requirements
                              .orderBy('experience', descending: true)
                              .snapshots(),
                          builder: (BuildContext context, AsyncSnapshot<
                              QuerySnapshot> snapshot) {
                            if (snapshot.hasError) {
                              return Text('Something went wrong');
                            }

                            if (snapshot.connectionState == ConnectionState
                                .waiting) {
                              return CircularProgressIndicator();
                            }

                            final data = snapshot.data!;

                            return SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: data.docs
                                    .map((doc) {
                                  final doctor = Doctor.fromSnapshot(doc);
                                  return Padding(
                                    padding: EdgeInsets.all(6.w),
                                    child: DoctorCardVertical(
                                      doctorpicture: doctor.imageUrl,
                                      name: doctor.name,
                                      specialization: doctor.speciality,
                                    ),
                                  );
                                })
                                    .take(5) // Display only three items
                                    .toList(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 36.h,
                  ),
                  Text(
                    'Explore more',
                    style: TextStyle(
                        color: Colors.black54,
                        fontFamily: 'Rubik',
                        fontWeight: FontWeight.w600,
                        fontSize: 18.sp,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(6.w),
                          child: Button(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => EmergencyDoctorPage()),
                              );
                            },
                            width: 112.w,
                            color: Colors.white,
                            textColor: Colors.black87,
                            childWidget: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 4.w),
                                  child: Image.asset(
                                    'assets/images/online.png',
                                    height: 36.h,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(4.w),
                                  child: const Center(
                                      child: Text(
                                        'Call Doctor\n      Now',
                                        style: TextStyle(color: Colors.black45),
                                      )),
                                ),
                              ],
                            ),
                            height: 98.h,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(6.w),
                          child: Button(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DiagnosticTests()),
                              );
                            },
                            width: 112,
                            color: Colors.white,
                            textColor: Colors.black87,
                            childWidget: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 4.w),
                                  child: Image.asset(
                                    'assets/images/lab-technician.png',
                                    height: 36,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(4.w),
                                  child: const Center(
                                      child: Text(
                                        'Book Lab\n     Test',
                                        style: TextStyle(color: Colors.black45),
                                      )),
                                ),
                              ],
                            ),
                            height: 98.h,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(6.w),
                          child: Button(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const AskDoctorPage()),
                              );
                            },
                            width: 112.w,
                            color: Colors.white,
                            textColor: Colors.black87,
                            childWidget: Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 4.w),
                                  child: Image.asset(
                                    'assets/images/ask-doctor.png',
                                    height: 36.h,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(4.w),
                                  child: const Center(
                                      child: Text(
                                        'Ask Doctor\n   For Free',
                                        style: TextStyle(color: Colors.black45),
                                      )),
                                ),
                              ],
                            ),
                            height: 98.h,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
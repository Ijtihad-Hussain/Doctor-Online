import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tele_consult/screens/user_side/departments.dart';
import 'package:tele_consult/screens/user_side/diagnostic_tests.dart';
import 'package:tele_consult/screens/user_side/emergency_doctor_page.dart';
import 'package:tele_consult/screens/user_side/prescription_upload_page.dart';
import 'package:tele_consult/widgets/doctor_card_vertical.dart';
import 'package:tele_consult/widgets/page_decoration.dart';
import '../../controllers/user_side/home_screen_controller.dart';
import '../../models/doctor.dart';
import '../../utils/colors.dart';
import '../../widgets/button.dart';
import '../doctor_side/contacts.dart';
import 'package:get/get.dart';

import 'User/menu.dart';
import 'User/my_appointments_screen.dart';
import 'doctor_related/find_doctors.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final HomeController controller = Get.put(HomeController());

  final List<Widget> pages = [
    Home(),
    MyAppointments(),
    Contacts(),
    FindDoctors(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() => BottomNavigationBar(
        currentIndex: controller.currentIndex.value,
        onTap: (index) => controller.changeIndex(index),
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
      )),
      body: Obx(() => pages[controller.currentIndex.value]),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue, // Use your color
        title: const Center(child: Text('Doctor Online')),
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {
            Get.to(Menu()); // Use GetX navigation
          },
        ),
      ),
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white, // Use your decoration
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10, bottom: 20),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        buildCard(
                          context,
                          'assets/images/book-appointment.png',
                          'Find And Book \n Appointment',
                          'Book Appointment',
                              () => Get.to(Departments()), // Use GetX navigation
                        ),
                        buildCard(
                          context,
                          'assets/images/call.png',
                          'Talk To Doctor \n       Online',
                          'Video Consultation',
                              () => Get.to(Departments()), // Use GetX navigation
                        ),
                      ],
                    ),
                  ),
                ),
                buildPopularDoctorsSection(),
                SizedBox(height: 36),
                Text(
                  'Explore more',
                  style: TextStyle(
                    color: Colors.black54,
                    fontFamily: 'Rubik',
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 10),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      buildExploreMoreButton(
                        context,
                        'assets/images/online.png',
                        'Call Doctor\n      Now',
                            () => Get.to(EmergencyDoctorPage()), // Use GetX navigation
                      ),
                      buildExploreMoreButton(
                        context,
                        'assets/images/lab-technician.png',
                        'Book Lab\n     Test',
                            () => Get.to(DiagnosticTests()), // Use GetX navigation
                      ),
                      buildExploreMoreButton(
                        context,
                        'https://img.freepik.com/free-icon/medicines_318-640321.jpg?size=626&ext=jpg&ga=GA1.2.653878381.1678705928&semt=ais',
                        '  Order\n Medicines',
                            () => Get.to(PrescriptionUploadPage()), // Use GetX navigation
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildCard(BuildContext context, String imagePath, String title, String buttonText, VoidCallback onPressed) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          width: 150,
          height: 120,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(12)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 4,
                offset: Offset(4, 8),
              ),
            ],
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: Image.asset(imagePath, height: 36),
                  ),
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
                  ),
                ],
              ),
              Button(
                width: 130,
                buttonText: buttonText,
                onPressed: onPressed,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPopularDoctorsSection() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(
            'Popular Doctors',
            style: TextStyle(
              color: Colors.black54,
              fontFamily: 'Rubik',
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          SizedBox(height: 10),
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('doctors')
                .where('experience', isGreaterThanOrEqualTo: '5 years')
                .orderBy('experience', descending: true)
                .snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }

              final data = snapshot.data!;

              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: data.docs.map((doc) {
                    final doctor = Doctor.fromSnapshot(doc);
                    return Padding(
                      padding: EdgeInsets.all(6),
                      child: DoctorCardVertical(
                        doctorpicture: doctor.imageUrl,
                        name: doctor.name,
                        specialization: doctor.speciality,
                      ),
                    );
                  }).take(5).toList(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget buildExploreMoreButton(BuildContext context, String imagePath, String title, VoidCallback onPressed) {
    return Padding(
      padding: EdgeInsets.all(6),
      child: Button(
        onPressed: onPressed,
        width: 112,
        color: Colors.white,
        textColor: Colors.black87,
        childWidget: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 4),
              child: imagePath.startsWith('http')
                  ? Image.network(imagePath, height: 36)
                  : Image.asset(imagePath, height: 36),
            ),
            Padding(
              padding: EdgeInsets.all(4),
              child: Center(
                  child: Text(
                    title,
                    style: const TextStyle(color: Colors.black45),
                  )),
            ),
          ],
        ),
        height: 98,
      ),
    );
  }
}

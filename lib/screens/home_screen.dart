import 'package:flutter/material.dart';
import 'package:tele_consult/screens/User/contacts.dart';
import 'package:tele_consult/screens/aboutDoctor/popularDoctors.dart';
import 'package:tele_consult/screens/askDoctorPage.dart';
import 'package:tele_consult/screens/departments.dart';
import 'package:tele_consult/screens/diagnosticTests.dart';
import 'package:tele_consult/screens/emergencyDoctorPage.dart';
import 'package:tele_consult/widgets/boxContainer.dart';
import 'package:tele_consult/widgets/contactBox.dart';
import 'package:tele_consult/widgets/customTextFormField.dart';
import 'package:tele_consult/widgets/doctorCardVertical.dart';
import 'package:tele_consult/widgets/pageDecoration.dart';
import '../utils/colors.dart';
import '../widgets/button.dart';
import '../widgets/clipRRectCard.dart';
import 'OnBoardings/splash_screen.dart';
import 'aboutDoctor/favouriteDoctor.dart';
import 'aboutDoctor/findDoctors.dart';
import 'User/menu.dart';
import 'mainMenu.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Icon customIcon = const Icon(Icons.search);

  List<Widget> pages = [
    Home(),
    FavouriteDoctor(),
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
      // appBar: AppBar(
      //   title: Text('Doctor Online'),
      // ),
      // extendBodyBehindAppBar: true,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: myCurrentIndex,
        onTap: onItemTap,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: "Favourites",
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
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kGBlue,
        // elevation: 1,
        title: const Center(child: Text('Doctor Online')),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.notifications_sharp),
            tooltip: 'Notification Icon',
            onPressed: () {
            },
          ), //IconButton
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/talhaYaseen.jpeg'),
              radius: 22,
            ),
          ), //IconButton
        ], //<Widget>[]
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
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: PageDecoration.pageDecoration,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Departments()),
                            );
                          },
                          child: Container(
                            width: 160,
                            height: 100,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 4,
                                  offset: Offset(4, 8), // Shadow position
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                        'assets/images/book-appointment.png',
                                        height: 36,
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
                                  width: 140,
                                  buttonText: 'Book Appointment',
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Departments()),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Departments()),
                            );
                          },
                          child: Container(
                            width: 160,
                            height: 100,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 4,
                                  offset: Offset(4, 8), // Shadow position
                                ),
                              ],
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.asset(
                                        'assets/images/call.png',
                                        height: 36,
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
                                  width: 140,
                                  buttonText: 'Video Consultation',
                                  color: Colors.redAccent,
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Departments()),
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
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 10, bottom: 12),
                      child: Text(
                        'Popular Doctors',
                        style: TextStyle(
                            color: Colors.black54,
                            fontFamily: 'Rubik',
                            fontWeight: FontWeight.w600,
                            fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    // const Padding(padding: EdgeInsets.only(left: 12)),
                    DoctorCardVertical(
                      name: 'Lewis Neill',
                      belowName: 'Dentist',
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    DoctorCardVertical(
                      name: 'Rodney Jackson',
                      belowName: 'Heart Specialist',
                      doctorpicture: 'assets/images/ly1.png',
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                    DoctorCardVertical(
                      name: 'Violet Zellweger',
                      belowName: 'Child Specialist',
                      doctorpicture: 'assets/images/gy1.png',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Explore more',
                  style: TextStyle(
                      color: Colors.black54,
                      fontFamily: 'Rubik',
                      fontWeight: FontWeight.w600,
                      fontSize: 18),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.5),
                    child: Button(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => EmergencyDoctorPage()),
                        );
                      },
                      width: 112,
                      color: Colors.white,
                      textColor: Colors.black87,
                      childWidget: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Image.asset(
                              'assets/images/online.png',
                              height: 36,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Center(
                                child: Text(
                              'Call Doctor\n      Now',
                              style: TextStyle(color: Colors.black45),
                            )),
                          ),
                        ],
                      ),
                      // buttonText: 'Call Doctor Now',
                      height: 80,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.5),
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
                            padding: const EdgeInsets.only(top: 4),
                            child: Image.asset(
                              'assets/images/lab-technician.png',
                              height: 36,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Center(
                                child: Text(
                              'Book Lab\n     Test',
                              style: TextStyle(color: Colors.black45),
                            )),
                          ),
                        ],
                      ),
                      // buttonText: 'Call Doctor Now',
                      height: 80,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.5),
                    child: Button(
                      onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AskDoctorPage()),
                      );
                    },

                      width: 112,
                      color: Colors.white,
                      textColor: Colors.black87,
                      childWidget: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Image.asset(
                              'assets/images/ask-doctor.png',
                              height: 36,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.all(4.0),
                            child: Center(
                                child: Text(
                                  'Ask Doctor\n   For Free',
                                  style: TextStyle(color: Colors.black45),
                                )),
                          ),
                        ],
                      ),
                      // buttonText: 'Call Doctor Now',
                      height: 80,
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

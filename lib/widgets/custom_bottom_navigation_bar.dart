import 'package:flutter/material.dart';
import 'package:tele_consult/screens/user_side/home_screen.dart';

import '../screens/user_side/doctor_related/favourite_doctor.dart';
import '../screens/user_side/doctor_related/find_doctors.dart';


class CustomBottomNavigationBar extends StatefulWidget {

  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {

  List pages = [
    HomeScreen(),
    FavouriteDoctor(),
    FindDoctors(),
  ];

  int myCurrentIndex = 0;
  void onItemTap(int index){
    setState((){
      myCurrentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
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
            icon: Icon(Icons.more_horiz),
            label: "More",
          ),
        ],

    );
  }
}

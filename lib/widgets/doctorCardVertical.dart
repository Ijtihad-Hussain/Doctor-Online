import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../utils/colors.dart';
import '../utils/customTextStyles.dart';

class DoctorCardVertical extends StatelessWidget {
  double? height;
  double? width;
  String? name;
  String? belowName;
  String? doctorpicture;

  DoctorCardVertical(
      {this.height, this.width, this.name, this.belowName, this.doctorpicture});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 160,
      width: width ?? 120,
      decoration: BoxDecoration(
        color: kGBlue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Column(
            children: [
                  Image.asset(
                    doctorpicture ?? 'assets/images/cheerful-doctor.jpg',
                    height: height ?? 100,
                    width: width ?? 120,
                  ),
            ],
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    name ?? 'Doctor Name',
                    style: const TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    belowName ?? 'Specialization',
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      color: Colors.white60,
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                    ),
                  ),
                ),
                RatingBar.builder(
                  itemSize: 10,
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {

                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

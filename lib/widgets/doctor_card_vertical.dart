import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../utils/colors.dart';
import '../utils/custom_tex_styles.dart';

class DoctorCardVertical extends StatelessWidget {
  double? height;
  double? width;
  String? name;
  String? specialization;
  String? doctorpicture;

  DoctorCardVertical(
      {this.height, this.width, this.name, this.specialization, this.doctorpicture});

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
              DoctorImageWidget(
                doctorPicture: doctorpicture ?? 'https://example.com/doctor-profile-picture.jpg',
                height: 100,
                width: 120,
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
                    specialization ?? 'Specialization',
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      color: Colors.white60,
                      fontWeight: FontWeight.bold,
                      fontSize: 11,
                    ),
                  ),
                ),
                IgnorePointer(
                  child: RatingBar.builder(
                    itemSize: 10,
                    initialRating: 4.7,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: const EdgeInsets.symmetric(horizontal: 2.0),
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {},
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class DoctorImageWidget extends StatelessWidget {
  final String? doctorPicture;
  final double height;
  final double width;

  DoctorImageWidget({
    this.doctorPicture,
    this.height = 100,
    this.width = 120,
  });

  @override
  Widget build(BuildContext context) {
    Widget imageWidget;

    if (doctorPicture != null && (doctorPicture!.startsWith('http') || doctorPicture!.startsWith('https'))) {
      imageWidget = Image.network(
        doctorPicture!,
        height: height,
        width: width,
      );
    } else {
      imageWidget = Image.asset(
        doctorPicture ?? 'assets/images/cheerful-doctor.jpg',
        height: height,
        width: width,
      );
    }

    return Container(
      child: imageWidget,
    );
  }
}

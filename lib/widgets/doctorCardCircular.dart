import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../utils/colors.dart';
import '../utils/customTextStyles.dart';

class DoctorCardCircular extends StatelessWidget {
  double? height;
  double? width;
  String? name;
  String? belowName;
  ImageProvider? doctorpicture;

  DoctorCardCircular(
      {this.height, this.width, this.name, this.belowName, this.doctorpicture});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 180,
      width: width ?? 160,
      decoration: BoxDecoration(
        color: kLightBlue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  backgroundImage: doctorpicture?? const AssetImage(
                      'assets/images/cheerful-doctor.jpg'
                  ),
                  radius: 54,
                ),
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
                    style: CustomTextStyles.boldStyle,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                    belowName ?? 'Specialization',
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 12,
                    ),
                  ),
                ),
                RatingBar.builder(
                  itemSize: 12,
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
                  onRatingUpdate: (rating) {},
                ),
              ],
            ),
          ),
    ],
      ),
    );
  }
}

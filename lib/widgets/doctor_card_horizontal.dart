import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../utils/colors.dart';
import '../utils/custom_tex_styles.dart';

class DoctorCardHorizontal extends StatelessWidget {
  double? height;
  double? width;
  String? name;
  String? belowName;
  Image? doctorpicture;

  DoctorCardHorizontal(
      {this.height, this.width, this.name, this.belowName, this.doctorpicture});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 100,
      width: width ?? 300,
      decoration: BoxDecoration(
        color: kLightBlue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: doctorpicture ??
                    Image.asset(
                      'assets/images/doctorm.jpg',
                      width: 60,
                    ),
              ),
            ],
          ),

          Expanded(
            flex: 1,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Text(
                    name ?? 'Doctor Name',
                    style: CustomTextStyles.boldStyle,
                  ),
                ),
                Text(
                  belowName ?? 'text',
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 12,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RatingBar.builder(
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
                    onRatingUpdate: (rating) {

                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 40, top: 5),
                  child: Icon(Icons.favorite_border),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

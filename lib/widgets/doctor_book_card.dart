import 'package:flutter/material.dart';
import 'package:tele_consult/widgets/button.dart';

import '../utils/colors.dart';
import '../utils/custom_tex_styles.dart';

class DoctorBookCard extends StatefulWidget {
  String? availability;
  String? name;
  String? specialization;
  String? experience;
  Image? doctorpicture;
  String? feePerHour;
  double? height;
  double? width;
  Color? color;
  ValueGetter<void>? onPressed;

  DoctorBookCard(
      {super.key,
      this.availability,
      this.name,
      this.experience,
      this.specialization,
      this.doctorpicture,
        this.color,
        this.height,
        this.width,
        this.feePerHour,
      this.onPressed});

  @override
  State<DoctorBookCard> createState() => _DoctorProfileCardState();
}

class _DoctorProfileCardState extends State<DoctorBookCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height ?? 180,
      width: widget.width ?? 360,
      decoration: BoxDecoration(
        color: widget.color ?? Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 2,
            offset: Offset(2, 2)
          ),
        ]
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: widget.doctorpicture ??
                      Image.asset(
                        'assets/images/doctorm.jpg',
                        width: 80,
                      ),
                ),
                const Text(
                  'Next Available',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    widget.availability ?? 'availability timing',
                    style: const TextStyle(color: Colors.blueGrey, fontSize: 9),
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 24,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.name ?? 'Doctor Name',
                    style: CustomTextStyles.boldStyle,
                  ),
                ),
                Text(
                  widget.specialization ?? 'Specialist',
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    color: Colors.green,
                    fontSize: 12,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.experience ?? 'Years of Experience',
                    style: const TextStyle(color: Colors.blueGrey, fontSize: 10),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 40, top: 5),
                  child: Icon(Icons.favorite_border),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Button(
                    buttonText: 'Book Appointment',
                    width: 125,
                    fontSize: 10,
                    onPressed: widget.onPressed!,
                  ),
                ),
                Button(
                  buttonText: 'Video Consultation',
                  width: 125,
                  fontSize: 10,
                  color: Colors.redAccent,
                  onPressed: widget.onPressed!,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

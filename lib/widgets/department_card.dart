import 'package:flutter/material.dart';

class DepartmentCard extends StatefulWidget {
  String? name;
  String? belowText;
  double? height;
  double? width;
  Color? color;
  Image? icon;
  ValueGetter<void>? onPressed;

  DepartmentCard(
      {super.key,
      this.belowText,
      this.name,
      this.icon,
      this.color,
      this.height,
      this.width,
      this.onPressed});

  @override
  State<DepartmentCard> createState() => _DepartmentCardState();
}

class _DepartmentCardState extends State<DepartmentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height ?? 60,
      width: widget.width ?? 320,
      decoration: BoxDecoration(
          color: widget.color ?? Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(color: Colors.grey, blurRadius: 2, offset: Offset(1, 1)),
          ]),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: widget.icon ?? Image.asset(
                'assets/images/heart.png',
                height: 50,
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.name ?? 'Cardiologist',
                    style: const TextStyle(fontSize: 22,fontWeight: FontWeight.bold, color: Colors.blueGrey),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Text(
                    widget.belowText ?? '5 Doctor available',
                    style: const TextStyle(fontSize: 12,color: Colors.blueGrey),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
